From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 28 Jul 2017 20:41:47 +0000
Subject: [PATCH 00/11] constify hc_driver structures
Message-Id: <1501274518-25170-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org

The hc_driver structure is only passed as the first argument to
usb_create_hcd, which is declared as const.  Thus the hc_driver structure
itself can be const.

Done with the help of Coccinelle.

// <smpl>
@r disable optional_qualifier@
identifier i;
position p;
@@

static struct hc_driver i@p = { ... };

@ok1@
identifier r.i;
expression e1;
position p;
@@

usb_create_hcd(&i@p,...)

@bad@
position p != {r.p,ok1.p};
identifier r.i;
struct hc_driver e;
@@

e@i@p

@depends on !bad disable optional_qualifier@
identifier r.i;
@@

static
+const
 struct hc_driver i = { ... };
// </smpl>

---

 drivers/staging/greybus/usb.c        |    2 +-
 drivers/usb/c67x00/c67x00-hcd.c      |    2 +-
 drivers/usb/host/hwa-hc.c            |    2 +-
 drivers/usb/host/isp116x-hcd.c       |    2 +-
 drivers/usb/host/isp1362-hcd.c       |    2 +-
 drivers/usb/host/max3421-hcd.c       |    2 +-
 drivers/usb/host/r8a66597-hcd.c      |    2 +-
 drivers/usb/host/sl811-hcd.c         |    2 +-
 drivers/usb/host/u132-hcd.c          |    2 +-
 drivers/usb/host/whci/hcd.c          |    2 +-
 drivers/usb/renesas_usbhs/mod_host.c |    2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)
