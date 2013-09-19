From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 19 Sep 2013 10:17:42 +0000
Subject: devm functions
Message-Id: <alpine.DEB.2.02.1309191212060.2251@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Is there a list anywhere of the kinds of drivers that are allowed to use
devm functions?

I know that it is possible for platform drivers, but by tracing backwards
from calls to eg the platform driver probe function, it was not easy to
see why this was so - one seems to run into several levels of functions
pointers, that I didn't bother tracing through.  Perhaps I have missed
something obvious.

As an approximation, I collected the entry points (functions stored insome
data structure) for which there is at least one definition that calls
devm_kzalloc.  The list on a moderately recent linux-next is as follows:

amba_driver.probe
ata_port_operations.port_start
drm_driver.load
dw_mci_drv_data.init
ecard_driver.probe
hid_driver.input_configured
hid_driver.probe
i2c_driver.probe
iio_info.update_scan_mode
iommu_ops.attach_dev
macio_driver.probe
mipi_dsim_lcd_driver.probe
pci_driver.probe
pcmcia_driver.probe
pinctrl_ops.dt_node_to_map
platform_driver.probe
pwm_ops.request
sdio_driver.probe
sh_pfc_soc_operations.init
snd_soc_codec_driver.probe
spi_driver.probe
usb_driver.probe
v4l2_subdev_internal_ops.registered

thanks,
julia
