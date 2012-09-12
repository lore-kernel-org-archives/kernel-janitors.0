From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 12 Sep 2012 08:26:22 +0000
Subject: [balbi-usb:merge-result-for-greg 66/99] drivers/usb/core/hub.c:2654 usb_get_hub_port_power_state() e
Message-Id: <20120912082622.GB27847@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@ti.com>
Cc: kernel-janitors@vger.kernel.org, linux-omap@vger.kernel.org, linux-usb@vger.kernel.org

Hi Felipe,

FYI, there are new smatch warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git merge-result-for-greg
head:   23953bde3e4d6aa8780dc054f6ad9882ac63f4f4
commit: e918fa161f510136fce45a524e934fe20e62c8b1 [66/99] Merge tag 'gadget-for-v3.7' into merge-result-for-greg

drivers/usb/core/hub.c:2654 usb_get_hub_port_power_state() error: doing dma on the stack ((null))
drivers/usb/core/hub.c:4733 store_port_power_control() info: why not propagate 'ret' from set_port_feature() instead of -5?
drivers/usb/core/hub.c:4744 store_port_power_control() info: why not propagate 'ret' from clear_port_feature() instead of -5?

vim +2654 drivers/usb/core/hub.c
  2644		return ret;
  2645	}
  2646	
  2647	static int usb_get_hub_port_power_state(struct usb_device *hdev, int port1)
  2648	{
  2649		struct usb_hub *hub = hdev_to_hub(hdev);
  2650		struct usb_port_status data;
  2651		u16 portstatus;
  2652		int ret;
  2653	
> 2654		ret = get_port_status(hub->hdev, port1, &data);
  2655		if (ret < 4) {
  2656			dev_err(hub->intfdev,
  2657				"%s failed (err = %d)\n", __func__, ret);
  2658			if (ret >= 0)
  2659				ret = -EIO;
  2660			return ret;
  2661		} else
  2662			portstatus = le16_to_cpu(data.wPortStatus);
  2663		return port_is_power_on(hub, portstatus);
  2664	}

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
