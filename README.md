# Color Trace Standalone

本项目为Color Trace项目集成了独立的运行环境

[Color Trace Gitee](https://gitee.com/haujet/color-trace)

[Color Trace GitHub](https://github.com/HaujetZhao/color-trace)

## 📝 原理

它的原理是：

- 集成`python-3.8.0-embed-amd64`使得脚本在Windows x64机器上可以直接运行，不需要安装Python环境

- 在`third-party-cmd`集成了`ImageMagick-7.1.1-28-portable-Q16-HDRI-x64`、`pngquant-2.17.0`、`potrace-1.16.win64`，使得无需安装任何依赖

## 👍 使用方式

到release里面下载安装包，安装后进入color-trace命令使用

根据`推荐的脚本参数.txt`直接在命令行中使用：

```
标准：
color-trace.bat -i "输入的位图全路径" -c 采用的颜色数量 -s -o "输出的矢量全路径"

获得更多细节/更少细节：(缩放系数大于1获得更多细节，小于1损失部分细节)
color-trace.bat -i "输入的位图全路径" -c 采用的颜色数量 -s -p 缩放系数 -o "输出的矢量全路径"

单文件示例：
color-trace.bat -i "D:\位图.png" -c 3 -s -o "D:\矢量.svg"

批处理示例：
color-trace.bat -i "D:\位图  文件夹\*.png" -c 3 -s -o "D:\矢量  文件夹\*.svg"
```

详细命令行参数及其解释如下：

```
usage: color-trace.py [-h] -i src [src ...] [-o dest] [-d destdir] [-C N]
                      [--width <dim>] [--height <dim>] [-c N] [-q algorithm]
                      [-fs | -ri] [-r paletteimg] [-s] [-p size] [-D size]
                      [-S threshold] [-O tolerance] [-bg] [-v] [--version]

optional arguments:
  -h, --help, /?        显示帮助
  -i src [src ...], --input src [src ...]
                        输入文件，支持 * 和 ? 通配符
  -o dest, --output dest
                        输出保存路径，支持 * 通配符
  -d destdir, --directory destdir
                        输出保存的文件夹
  -C N, --cores N       多进程处理的进程数 (默认使用全部核心)
  --width <dim>         输出 svg 图像宽度，例如：6.5in、 15cm、100pt，默认单位是 inch
  --height <dim>        输出 svg 图像高度，例如：6.5in、 15cm、100pt，默认单位是 inch
  -c N, --colors N      [若未使用 -p 参数，则必须指定该参数] 表示在描摹前，先缩减到多少个颜色。最多 256
                        个。0表示跳过缩减颜色 (除非你的图片已经缩减过颜色，否则不推荐0)。
  -q algorithm, --quantization algorithm
                        颜色量化算法，即缩减颜色算法: mc, as. 'mc' (Median-Cut，中切，由
                        pngquant 实现，产生较少的颜色，这是默认); 'as' (Adaptive Spatial
                        Subdivision 自适应空间细分，由 ImageMagick 实现，产生的颜色更少);
                        如果 --colors 0 则不启用量化。
  -fs, --floydsteinberg
                        启用 Floyd-Steinberg 拟色 (适用于所有量化算法或 -p/--palette).警告:
                        任何米色算法都会显著的增加输出 svg 图片的大小和复杂度
  -ri, --riemersma      启用 Rimersa 拟色 (只适用于 as 量化算法或 -p/--palette)
  -r paletteimg, --remap paletteimg
                        使用一个自定义调色板图像，用于颜色缩减 [覆盖 -c 和 -q 选项]
  -s, --stack           堆栈描摹 (若要更精确的输出，推荐用这个)
  -p size, --prescale size
                        为得到更多的细节，在描摹前，先将图片进行缩放 (默认值: 1)。例如使用 2，描摹前先预放大两倍
  -D size, --despeckle size
                        抑制斑点的大小（单位是像素） (默认值：2)
  -S threshold, --smoothcorners threshold
                        转角平滑参数：0 表示不作平滑处理，1.334 是最大。（默认值：1.0
  -O tolerance, --optimizepaths tolerance
                        贝塞尔曲线优化参数: 最小是0，最大是5(默认值：0.2)
  -bg, --background     将第一个颜色这背景色，并尽可能优化最终的 svg
  -v, --verbose         打印出运行时的细节
  --version             显示程序版本
```