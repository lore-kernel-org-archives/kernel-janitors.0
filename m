From: Domen Puncer <domen@coderock.org>
Date: Thu, 18 Nov 2004 14:22:33 +0000
Subject: [KJ] Re: net/3c59x: module_param conversions
Message-Id: <20041118142233.GC5645@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============079134997978947297=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============079134997978947297==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 18/11/04 14:19 +0100, Steffen Klassert wrote:
> On Tue, Nov 16, 2004 at 07:10:44PM +0100 or thereabouts, Domen Puncer wrote:
> > Convert 3c59x.c to new module parameter api.
> > Variables are moved before module_param*.
> 
> Just a remark,
> the module_param conversion for the 3c59x driver is already in the -mm tree.
> Many people route their patches through -mm, so it is in general a good 
> idea to look whats in -mm before starting to work.

Yeah, it's a good idea for popular conversions.

Anyway, in rc2-mm2:
--- linux-2.6.10-rc2/drivers/net/3c59x.c        2004-11-14 21:05:31.000000000 -0
800
+++ 25/drivers/net/3c59x.c      2004-11-17 23:21:24.184865960 -0800
@@ -277,6 +277,7 @@ MODULE_AUTHOR("Donald Becker <becker@scy
 MODULE_DESCRIPTION("3Com 3c59x/3c9xx ethernet driver "
                                        DRV_VERSION " " DRV_RELDATE);
 MODULE_LICENSE("GPL");
+MODULE_VERSION(DRV_VERSION);
 
 MODULE_PARM(debug, "i");
^^^
Doesn't seem converted.
Maybe you mean via-rhine patches; those are in.


	Domen

--===============079134997978947297==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============079134997978947297==--
