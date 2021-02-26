<script>
    let dataTransaction = $('#container').attr('data-json');
    let dataTurnOver = $('#container2').attr('data-json');
    let dataListMoney = $('#container2').attr('data-money');
    let dataListMoneyDefault = $('#container2').attr('data-money-default');
    data = JSON.parse(dataTransaction);
    ListDay = JSON.parse(dataTurnOver);
    dataListMoney = JSON.parse(dataListMoney);
    dataListMoneyDefault = JSON.parse(dataListMoneyDefault);
            Highcharts.chart('container', {
        chart: {
        plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false,
                    type: 'pie'
                },
                title: {
        text: 'Thống kê đơn hàng'
                },
                tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                accessibility: {
        point: {
        valueSuffix: '%'
                    }
                },
                plotOptions: {
        pie: {
        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
        enabled: true,
                            format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                        }
                    }
                },
                series: [{
        name: 'Brands',
                    colorByPoint: true,
                    data: data
                }]
            });

            Highcharts.chart('container2', {
        chart: {
        type: 'spline'
                },
                title: {
        text: 'Doanh thu theo ngày'
                },
                subtitle: {
        text: 'Source: MyCompany.com'
                },
                xAxis: {
        categories: ListDay
                },
                yAxis: {
        title: {
        text: 'Doanh thu'
                    },
                    labels: {
        formatter: function () {
                            return this.value + '°';
                        }
                    }
                },
                tooltip: {
        crosshairs: true,
                    shared: true
                },
                plotOptions: {
        spline: {
        marker: {
        radius: 4,
                            lineColor: '#666666',
                            lineWidth: 1
                        }
                    }
                },
                series: [{
        name: 'Hoàn tất giao dịch',
                    marker: {
        symbol: 'square'
                    },
                    data: dataListMoney
                },
                {
        name: 'Đang chờ xử lý',
                    marker: {
        symbol: 'square'
                    },
                    data: dataListMoneyDefault
                }
                ]

            });

        </script>
<script>

    $(function () {
            if ($(".js-select2-keyword").length > 0) {
        $('.js-select2-keyword').select2({
            placeholder: "Chọn từ khóa",
            maximumSelectionLength: 3
        })
    }
            $('.js-preview-transaction').click(function (event) {
        event.preventDefault();
                let $this = $(this);
                let URL = $this.attr('href');
                let ID = $this.attr('data-id');
                $("#idTransaction").html("#" + ID);
                $.ajax({
        url: URL
                })
                    .done(function (results) {
        $('#modal-preview-transaction .content').html(results.html)
                        $("#modal-preview-transaction").modal({
        show: true
                        })
                    })
            })
            $('body').on("click", ".order-delete", function (event) {
        event.preventDefault();
                let URL = $(this).attr('href');
                $.ajax({
        url: URL
                }).done(function (result) {
                    if (result.code == 299) {
        $(this).parent("tr").remove();
                    }
                });

            })
            $(".js-query-confirm").click(function (event) {
        event.preventDefault();
                let URL = $(this).attr('href');
                $.confirm({
        title: 'Bạn có muốn xóa dữ liệu không ?',
                    content: 'Dữ liệu xóa đi không thể khôi phục',
                    type: 'red',
                    buttons: {
        ok: {
        text: "ok",
                            btnClass: "btn-primary",
                            keys: ['enter'],
                            action: function () {
        window.location.href = URL;
                            }
                        },
                        cancel: function () {

    },

                    }
                });
            })
        })
    </script>