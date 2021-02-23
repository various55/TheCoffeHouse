import bs4
import pandas
import requests
if __name__ == '__main__':
	url = 'https://www.thecoffeehouse.com/collections/menu'
	page = requests.get(url,headers={"Accept-Language":"en-US"})
	htmls = bs4.BeautifulSoup(page.text,"html.parser")
	soup = get_page_content(url)