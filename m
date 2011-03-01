From: Dan Carpenter <error27@gmail.com>
Date: Tue, 01 Mar 2011 15:43:02 +0000
Subject: Re: minor bug ?
Message-Id: <20110301154301.GS18043@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Mar 01, 2011 at 09:02:21PM +0530, Prashant Shah wrote:
> Hi,
> 
> file : include/linux/blkdev.h
> 
>  31. struct request;
>  32. struct sg_io_hdr;
>  33.
>  34. #define BLKDEV_MIN_RQ   4
>  35. #define BLKDEV_MAX_RQ   128     /* Default maximum */
>  36.
>  37. struct request;
> 
> there is duplicate struct request; on line no. 31 and 37
> 

Sure.  Send a patch for that.

regards,
dan carpenter

