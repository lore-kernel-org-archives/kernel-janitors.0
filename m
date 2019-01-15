From: Matthew Wilcox <willy@infradead.org>
Date: Tue, 15 Jan 2019 21:07:26 +0000
Subject: Re: [PATCH] XArray: Fix a math problem in xa_is_err()
Message-Id: <20190115210726.GC6310@bombadil.infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190115195241.GB1074@kadam>
In-Reply-To: <20190115195241.GB1074@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jan 15, 2019 at 10:52:41PM +0300, Dan Carpenter wrote:
> @@ -177,7 +177,8 @@ static inline bool xa_is_internal(const void *entry)
>  static inline bool xa_is_err(const void *entry)
>  {
>  	return unlikely(xa_is_internal(entry) &&
> -			(unsigned long)entry >= -((MAX_ERRNO << 2) + 2));
> +			(unsigned long)entry >> +				(((unsigned long)(-MAX_ERRNO << 2) + 2)));
>  }

Ugh all the brackets, I'm not surprised I got it wrong.  How about this
instead; does it make your static checker happy?

diff --git a/include/linux/xarray.h b/include/linux/xarray.h
index 7da665f5cb20..5d9d318bcf7a 100644
--- a/include/linux/xarray.h
+++ b/include/linux/xarray.h
@@ -177,7 +177,7 @@ static inline bool xa_is_internal(const void *entry)
 static inline bool xa_is_err(const void *entry)
 {
        return unlikely(xa_is_internal(entry) &&
-                       (unsigned long)entry >= -((MAX_ERRNO << 2) + 2));
+                       entry >= xa_mk_internal(-MAX_ERRNO));
 }
 
 /**

(passes sparse & gcc, but ...)
