# Ibotta Take-Home Assignment - ProductViewer

ProductViewer is an application for viewing offers on products. A user is able to tap on a cell to view details for that offer and to 'favorite' the item. When favoriting an item, an indicator is marked on the detail page and on the main page in order to set those items apart.

### KingFisher

This application makes use of the [Kingfisher](https://github.com/onevcat/Kingfisher) library to fetch and cache images. The library makes use of both a disk cache and a memory cache for images. Kingfisher will automatically look for the image in the caches before creating a fetch session.

~~~swift
let imageView = UIImageView()

if let url = URL(string: "http://sampleurl.com/images/image0.png") {
	imageView.kf.setImage(with: url)
}
~~~

Kingfisher supports changing the disk and memory cache size as a global setting. Both disk and memory caching are optional. Kingfisher's memory cache is automatically flushed when the app receives a memory warning.

\- Ricky Munz