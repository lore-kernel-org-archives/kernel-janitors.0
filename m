From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Sat, 20 Mar 2004 00:11:39 +0000
Subject: Re: [Kernel-janitors] [TRIVIAL] - section drivers/acpi/asus_acpi.c.
Message-Id: <20040319161139.362bfd71.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1079724660.14846.38.camel@telecentrolivre>
In-Reply-To: <1079724660.14846.38.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 19 Mar 2004 16:31:43 -0300 Luiz Fernando Capitulino wrote:

| Hi all,
| 
|  I need to be more descriptive in this patches. :-)

Yes, everyone does.  I appreciate you doing that.


|  asus_hotk_remove() is only called when drivers is being
| removed.

Hm, how did you come to this conclusion?  I don't see that
as I look at drivers/acpi/scan.c, around line # 262,
in function acpi_bus_driver_init():   <<< note the "init" >>>

	if (driver->ops.start) {
		result = driver->ops.start(device);
		if (result && driver->ops.remove)
			driver->ops.remove(device, ACPI_BUS_REMOVAL_NORMAL);
		return_VALUE(result);
	}


| diff -Nparu linux-2.6.5-rc1/drivers/acpi/asus_acpi.c linux-2.6.5-rc1~/drivers/acpi/asus_acpi.c
| --- linux-2.6.5-rc1/drivers/acpi/asus_acpi.c	2004-02-18 15:54:21.000000000 -0300
| +++ linux-2.6.5-rc1~/drivers/acpi/asus_acpi.c	2004-03-16 19:15:33.000000000 -0300
| @@ -1097,7 +1097,7 @@ static int __init asus_hotk_add(struct a
|  }
|  
|  
| -static int asus_hotk_remove(struct acpi_device *device, int type)
| +static int __exit asus_hotk_remove(struct acpi_device *device, int type)
|  {
|  	acpi_status status = 0;
|  	struct asus_hotk *hotk = NULL;

--
~Randy
"You can't do anything without having to do something else first."
-- Belefant's Law
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
