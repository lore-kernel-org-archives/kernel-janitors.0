From: Jitendra Kalsaria <jitendra.kalsaria@qlogic.com>
Date: Fri, 25 Jan 2013 20:48:02 +0000
Subject: RE: [patch] qlcnic: silence false positive overflow warning
Message-Id: <BECD8E8A1B550B48A1BF97C13991F60E05050A@avmb2.qlogic.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130125064141.GB4882@elgon.mountain>
In-Reply-To: <20130125064141.GB4882@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sony Chacko <sony.chacko@qlogic.com>, Dept-Eng Linux Driver <Linux-Driver@qlogic.com>, netdev <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

>From: Dan Carpenter [mailto:dan.carpenter@oracle.com] 
>Sent: Thursday, January 24, 2013 10:42 PM
>To: Jitendra Kalsaria
>Cc: Sony Chacko; Dept-Eng Linux Driver; netdev; kernel-janitors@vger.kernel.org
>Subject: [patch] qlcnic: silence false positive overflow warning
>
>We actually store the MAC address as well as the board_name here.  The
>longest board_name is 75 characters so there is more than enough room
>to hold the 17 character MAC and the ": " divider.  But making this
>buffer larger silences a static checker warning.
>
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>---
>I'm not sure if this is worth sending.  Feel free to drop this if you
>want.

Acked-By: Jitendra Kalsaria <jitendra.kalsaria@qlogic.com>


