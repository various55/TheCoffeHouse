import requests
from bs4 import BeautifulSoup

if __name__ == '__main__':
	url = "https://www.thecoffeehouse.com/collections/menu"
	response = requests.get(url)
	soup = BeautifulSoup(response.content, "html.parser")
	# Tìm tất cả các thẻ products
	products = soup.findAll('div', class_='menu_item')
	for p in products:
		tittle = p.find("a").attrs["title"]
		image = url+p.find("a").attrs["href"]
		price = p.find("div",class_="price_product_item").text
		soup=BeautifulSoup(requests.get(image).content,"html.parser")
		details = soup.findAll("div",class_="product_description")
		print("__________________")
		print(tittle)
		print(price)
		print(image)
		for d in details:
			print(d.find(["p","h1","h2","h3","span","div"]).text)



#<div class="menu_item">
#<div class="menu_item_image">
#<a href="/products/hop-qua-tet-2021" title="HỘP QUÀ TẾT 2021"><img alt="hop qua tet 2021" src="//product.hstatic.net/1000075078/product/gift-set-app_08c73112c20e434ca35f555f07973d0a_large.jpg"/></a>
#<div class="new"><img alt="" class="svg-new" src="//file.hstatic.net/1000075078/file/orion_sheriff-star.svg"/><span>MỚI</span></div>
#</div>
#<div class="menu_item_info bg_white">
#<h3><a href="/products/hop-qua-tet-2021" title="HỘP QUÀ TẾT 2021">HỘP QUÀ TẾT 2021</a></h3>
#<div class="price_product_item">690,000 đ</div><a class="menu_item_action animate_btn" href="//order.thecoffeehouse.com/order" target="_blank" title="Mua Ngay">Mua ngay</a></div>	
