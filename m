From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 30 Nov 2014 18:14:11 +0000
Subject: [PATCH 0/4] remove unneeded array
Message-Id: <1417371255-2282-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org
Cc: sparmaintainer@unisys.com, linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, target-devel@vger.kernel.org

Remove an array or structure that only serves as the first argument to
memset.  The complete semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier x;
type T;
@@

{
... when any
-T x[...];
<+... when != x
- memset(x,...);
...+>
}

@@
identifier x,i;
@@

{
... when any
-struct i x;
<+... when != x
- memset(&x,...);
...+>
}
// </smpl>

