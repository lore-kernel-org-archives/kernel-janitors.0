From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Mon, 15 Feb 2010 22:20:41 +0000
Subject: [PATCH] drm/nouveau: fix pramdac_table range checking
Message-Id: <20100215222041.GA2823@joi.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100215124046.GB18821@bicker>
In-Reply-To: <20100215124046.GB18821@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: nouveau@lists.freedesktop.org
Cc: Dan Carpenter <error27@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Feb 15, 2010 at 03:40:56PM +0300, Dan Carpenter wrote:
> This is the results from:
>     make C=1 CHECK="/path/to/smatch -p=kernel" bzImage modules | tee warns.txt
>     grep -w overflow warns.txt | uniq -f 3 | tee err-list
> 
> I hacked on the buffer overflow check last weekend and these are the 
> results.  It has way more false positives than the other bug lists 
> I've posted, but it's still kinda neat.
> 
> It works like this:
> 
> lib/zlib_inflate/inftrees.c
>    112      for (min = 1; min <= MAXBITS; min++)
>    113          if (count[min] != 0) break;
>    114      if (root < min) root = min;
> smatch thinks "min" can be MAXBITS here.
> 
> One bad thing is that if you have code like:
>         if (foo = 42)
> 		frob();
> Smatch thinks that "foo" can be 43 after the if statement.
> 
> The format is:
> file.c +<line> function(<lines into function>) warning 'array_name' <array size> <= <offset>
> 
> regards,
> dan carpenter
> 
> Previous bug lists:
> * Putting too much data on the stack
>   http://lkml.indiana.edu/hypermail/linux/kernel/1002.1/01252.html
> 
> * Assigning negative values to unsigned variables
>   http://lkml.indiana.edu/hypermail/linux/kernel/1001.3/01222.html
> 
> * Doing dma on the stack
>   http://lkml.indiana.edu/hypermail/linux/kernel/1001.3/01231.html
> 
> * Dereferencing variables before verifying they are not null
>   http://lkml.indiana.edu/hypermail/linux/kernel/1001.3/01980.html
> 
> (...)
> drivers/gpu/drm/nouveau/nouveau_bios.c +770 get_tmds_index_reg(36) error: buffer overflow 'pramdac_table' 4 <= 4
> (...)

---
From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: [PATCH] drm/nouveau: fix pramdac_table range checking

get_tmds_index_reg reads some value from stack when mlv happens
to be equal to size of pramdac_table array. Fix it.

Reported-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_bios.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index 2cd0fad..e7be506 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -762,7 +762,7 @@ static uint32_t get_tmds_index_reg(struct drm_device *dev, uint8_t mlv)
 			dacoffset ^= 8;
 		return 0x6808b0 + dacoffset;
 	} else {
-		if (mlv > ARRAY_SIZE(pramdac_table)) {
+		if (mlv >= ARRAY_SIZE(pramdac_table)) {
 			NV_ERROR(dev, "Magic Lookup Value too big (%02X)\n",
 									mlv);
 			return 0;
-- 
1.6.6.1

