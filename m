From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Mon, 19 Jan 2004 19:46:19 +0000
Subject: Re: [Kernel-janitors] [PATCH] comparison always false due to
Message-Id: <20040119114619.1356f3bf.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040118152607.GB15165@picchio.gall.it>
In-Reply-To: <20040118152607.GB15165@picchio.gall.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 18 Jan 2004 16:26:08 +0100 Daniele Venzano <venza@libero.it> wrote:

| Compiling 2.6.1 with -W as suggested somewhere in the TOSO list, i run
| into this warning:
| 
| drivers/atm/horizon.c: In function `hrz_check_args':
| drivers/atm/horizon.c:2905: warning: comparison is always false due to 
| limited range of data type
| 
| the code affected was this:
| 
| if (max_rx_size > RX_AAL5_LIMIT)
|       PRINTK (KERN_NOTICE, "max_rx_size has been limited to %hu",
| 	    max_rx_size = RX_AAL5_LIMIT);

Is this a real problem?
The code documents the limit/restriction/requirement,
and it doesn't generate any code since it's always false.
(Yes, I checked.)


| I could remove the code or make max_rx_size an int (was a short). Since
| removing code is usually not a good idea I made this patch:
| 
| --- linux-2.6.1/drivers/atm/horizon.c   2003-12-19 10:34:10.000000000 +0100
| +++ linux-2.6.1-kj/drivers/atm/horizon.c        2004-01-18 16:08:16.000000000 +0100
| @@ -360,7 +360,7 @@
|  static unsigned short debug = 0;
|  static unsigned short vpi_bits = 0;
|  static unsigned short max_tx_size = 9000;
| -static unsigned short max_rx_size = 9000;
| +static unsigned int max_rx_size = 9000;
|  static unsigned char pci_lat = 0;
|  
|  /********** access functions **********/


Anyway the patch is incomplete.  The MODULE_PARM() for max_rx_size
should also be changed if the change above is made.
MODULE_PARM(max_rx_size, "h");
                          ^-- says that it's "short"
                              but doesn't do typechecking,
	but new module param macros fix that.

--
~Randy
Everything is relative.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
