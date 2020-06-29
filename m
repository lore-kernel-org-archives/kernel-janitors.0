From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 29 Jun 2020 16:19:41 +0000
Subject: Re: Searching for initialisation of variables by function calls before null pointer checks
Message-Id: <5b693ee0-0cb1-7ff3-b562-bac6bcb6aae8@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1593410434-19406-1-git-send-email-chunfeng.yun@mediatek.com>
 <1593410434-19406-2-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1593410434-19406-2-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Coccinelle <cocci@systeme.lip6.fr>
Cc: Colin Ian King <colin.king@canonical.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> Some pointers are dereferenced before successful checks.

A source code place can be pointed out in an acceptable time frame for
a single file by the following script variant for the semantic patch language.


@display@
expression action1, action2;
expression* pointer1, pointer2;
identifier result1, result2;
statement is, es;
type t1, t2;
@@
 t1 result1 = <+...
*             action1(..., pointer1, ...)
              ...+>;
 ... when any
     when != pointer1
 t2 result2 = <+...
*             action2(..., pointer2, ...)
              ...+>;
 ... when any
     when != pointer1
     when != pointer2
*if (!pointer1 || !pointer2 || ...)
    is
 else
    es


elfring@Sonne:~/Projekte/Linux/next-patched> time spatch --profile --no-loops drivers/usb/mtu3/mtu3_gadget.c ~/Projekte/Coccinelle/janitor/show_pointer_usage_before_null_check11.cocci
…
@@ -332,14 +332,11 @@ error:

 static int mtu3_gadget_dequeue(struct usb_ep *ep, struct usb_request *req)
 {
-	struct mtu3_ep *mep = to_mtu3_ep(ep);
-	struct mtu3_request *mreq = to_mtu3_request(req);
 	struct mtu3_request *r;
 	unsigned long flags;
 	int ret = 0;
 	struct mtu3 *mtu = mep->mtu;

-	if (!ep || !req || mreq->mep != mep)
 		return -EINVAL;

 	dev_dbg(mtu->dev, "%s : req=%p\n", __func__, req);
---------------------
profiling result
---------------------
Main total                               : 2.030205 sec          1 count
Main.outfiles computation                : 1.648542 sec          1 count
…
real	0m2,122s
user	0m1,977s
sys	0m0,037s


I have tried this analysis approach out also for source files from
the software “Linux next-20200626”.

elfring@Sonne:~/Projekte/Linux/next-patched> XX=$(date) && spatch --no-loops --timeout 12 -j 4 --chunksize 1 -dir ~/Projekte/Linux/next-patched ~/Projekte/Coccinelle/janitor/show_pointer_usage_before_null_check11.cocci > ~/Projekte/Bau/Linux/scripts/Coccinelle/null/next/20200626/show_pointer_usage_before_null_check11.diff 2> ~/Projekte/Bau/Linux/scripts/Coccinelle/null/next/20200626/show_pointer_usage_before_null_check11-errors.txt; YY=$(date) && echo "$XX | $YY"
Mo 29. Jun 13:54:54 CEST 2020 | Mo 29. Jun 17:22:37 CEST 2020


Unfortunately, a lot of “exceptional” data processing results were logged then.

elfring@Sonne:~/Projekte/Bau/Linux/scripts/Coccinelle/null/next/20200626> grep 'EXN: Coccinelle_modules.Common.Timeout' show_pointer_usage_before_null_check11-errors.txt | wc -l
454


Will such a test run trigger any further development considerations?

Regards,
Markus
