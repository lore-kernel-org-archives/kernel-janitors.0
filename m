From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 21 Dec 2018 20:42:52 +0000
Subject: [PATCH] usb: gadget: Potential NULL dereference on allocation error
Message-Id: <20181221204252.GA29544@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

The source_sink_alloc_func() function is supposed to return error
pointers on error.  The function is called from usb_get_function() which
doesn't check for NULL returns so it would result in an Oops.

Of course, in the current kernel, small allocations always succeed so
this doesn't affect runtime.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/gadget/function/f_sourcesink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_sourcesink.c b/drivers/usb/gadget/function/f_sourcesink.c
index 9cdef108fb1b..ed68a4860b7d 100644
--- a/drivers/usb/gadget/function/f_sourcesink.c
+++ b/drivers/usb/gadget/function/f_sourcesink.c
@@ -838,7 +838,7 @@ static struct usb_function *source_sink_alloc_func(
 
 	ss = kzalloc(sizeof(*ss), GFP_KERNEL);
 	if (!ss)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	ss_opts =  container_of(fi, struct f_ss_opts, func_inst);
 
-- 
2.17.1
