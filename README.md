<a href="https://www.buymeacoffee.com/rodrigobastosv" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

#  Introduction

Package created for the purpose of uploading images from the internet, giving the possibility of showing a beautiful Shimmer animation while the images are not loading. And it is still possible to create a widget to be shown in case the image upload fails for some reason.

This package is basically a union of two known packages:
- [Cached Network Image](https://pub.dev/packages/cached_network_image)
- [Shimmer](https://pub.dev/packages/shimmer)

# Basic Usage

You can use the package on the fly by simple passing a URL of an image to the `FancyShimmerImage` widget.

```dart
FancyShimmerImage(  
  imageUrl: 'https://images.unsplash.com/photo-1465572089651-8fde36c892dd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',  
),
```

That will produce a image that's is cacheable by default and that has a default (grey) Shimmer animation.  Similar to result below:


![enter image description here](https://media.giphy.com/media/0a4JkRyAlHIrzOFyJf/giphy.gif)


# More Advanced Usage
If you don't like the default widget behavior, you can set the background colors of the image, the color of the shimmer base effect, and the color of the highlighted effect.

```dart
FancyShimmerImage(  
  imageUrl: 'https://static.businessinsider.sg/2018/12/12/5c1c90f8e04d6243c7019cf6.png',  
  shimmerBaseColor: randomColor(),  
  shimmerHighlightColor: randomColor(),  
  shimmerBackColor: randomColor(),  
)
```

By randomizing the colors you can have a result similar to this:

![enter image description here](https://media.giphy.com/media/6M45TkrEOoQwMdxbUm/giphy.gif)

Other thing you can do is to configure the direction of the Shimmer and it's speed. In the above example i configured it to have top to bottom direction and 300 milliseconds of speed.

![enter image description here](https://media.giphy.com/media/K8xbwab3zxGiUp2SHj/giphy.gif)

One last step you can configure is to configure the widget that will appear in case the image upload fails for some reason. In this case just pass the desired widget in the `errorWidget` parameter. If no value is passed, a default error widget will be used.

```dart
FancyShimmerImage(  
  imageUrl: 'https://static.businessinsider.sg/2018/12/12/5c1c90f8e04d6243c7019cf6.png',  
  errorWidget: Image.network('https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
)
```

![enter image description here](https://media.giphy.com/media/62PhjL4xknt0tNNOhQ/giphy.gif)
