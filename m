From: Prashant Shah <pshah.mumbai@gmail.com>
Date: Tue, 01 Mar 2011 15:44:21 +0000
Subject: minor bug ?
Message-Id: <AANLkTinntHCHrymOEj1MUU99TDBWb88mjvrA5vU+f_Fz@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110301154301.GS18043@bicker>
In-Reply-To: <20110301154301.GS18043@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

file : include/linux/blkdev.h

 31. struct request;
 32. struct sg_io_hdr;
 33.
 34. #define BLKDEV_MIN_RQ   4
 35. #define BLKDEV_MAX_RQ   128     /* Default maximum */
 36.
 37. struct request;

there is duplicate struct request; on line no. 31 and 37

http://lxr.linux.no/#linux+v2.6.37.2/include/linux/blkdev.h

Regards.
