From: Joe Perches <joe@perches.com>
Date: Tue, 17 Jul 2018 17:08:45 +0000
Subject: Re: [PATCH] ipv6: sr: fix useless rol32 call on hash
Message-Id: <99f5bcb9b5a3604264d43e7305950dcf7f6cfcc7.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180717155254.30367-1-colin.king@canonical.com>
         <6ab9af97-33b6-d5cc-d1e9-6e5fbd9158a8@gmail.com>
In-Reply-To: <6ab9af97-33b6-d5cc-d1e9-6e5fbd9158a8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Lebrun <dav.lebrun@gmail.com>, Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2018-07-17 at 17:03 +0100, David Lebrun wrote:
> On 07/17/2018 04:52 PM, Colin King wrote:
> > From: Colin Ian King<colin.king@canonical.com>
> > 
> > The rol32 call is currently rotating hash but the rol'd value is
> > being discarded. I believe the current code is incorrect and hash
> > should be assigned the rotated value returned from rol32.
> > 
> > Detected by CoverityScan, CID#1468411 ("Useless call")
> > 
> > Fixes: b5facfdba14c ("ipv6: sr: Compute flowlabel for outer IPv6 header of seg6 encap mode")
> > Signed-off-by: Colin Ian King<colin.king@canonical.com>
> 
> Acked-by: dlebrun@google.com
> 
> Good catch, thanks !
> 
> In that case, the same issue is present in 
> include/net/ipv6.h:ip6_make_flowlabel().

Perhaps all of the ror and rol definitions should add
__must_check

Something like the below and perhaps many more of the
functions that return some value should have __must_chedk
added as well.
---
 include/linux/bitops.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index af419012d77d..3cddde65c8bb 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -67,7 +67,7 @@ static inline __u64 rol64(__u64 word, unsigned int shift)
  * @word: value to rotate
  * @shift: bits to roll
  */
-static inline __u64 ror64(__u64 word, unsigned int shift)
+static inline __must_check __u64 ror64(__u64 word, unsigned int shift)
 {
 	return (word >> shift) | (word << (64 - shift));
 }
@@ -77,7 +77,7 @@ static inline __u64 ror64(__u64 word, unsigned int shift)
  * @word: value to rotate
  * @shift: bits to roll
  */
-static inline __u32 rol32(__u32 word, unsigned int shift)
+static inline __must_check __u32 rol32(__u32 word, unsigned int shift)
 {
 	return (word << shift) | (word >> ((-shift) & 31));
 }
@@ -87,7 +87,7 @@ static inline __u32 rol32(__u32 word, unsigned int shift)
  * @word: value to rotate
  * @shift: bits to roll
  */
-static inline __u32 ror32(__u32 word, unsigned int shift)
+static inline __must_check __u32 ror32(__u32 word, unsigned int shift)
 {
 	return (word >> shift) | (word << (32 - shift));
 }
@@ -97,7 +97,7 @@ static inline __u32 ror32(__u32 word, unsigned int shift)
  * @word: value to rotate
  * @shift: bits to roll
  */
-static inline __u16 rol16(__u16 word, unsigned int shift)
+static inline __must_check __u16 rol16(__u16 word, unsigned int shift)
 {
 	return (word << shift) | (word >> (16 - shift));
 }
@@ -107,7 +107,7 @@ static inline __u16 rol16(__u16 word, unsigned int shift)
  * @word: value to rotate
  * @shift: bits to roll
  */
-static inline __u16 ror16(__u16 word, unsigned int shift)
+static inline __must_check __u16 ror16(__u16 word, unsigned int shift)
 {
 	return (word >> shift) | (word << (16 - shift));
 }
@@ -117,7 +117,7 @@ static inline __u16 ror16(__u16 word, unsigned int shift)
  * @word: value to rotate
  * @shift: bits to roll
  */
-static inline __u8 rol8(__u8 word, unsigned int shift)
+static inline __must_check __u8 rol8(__u8 word, unsigned int shift)
 {
 	return (word << shift) | (word >> (8 - shift));
 }
@@ -127,7 +127,7 @@ static inline __u8 rol8(__u8 word, unsigned int shift)
  * @word: value to rotate
  * @shift: bits to roll
  */
-static inline __u8 ror8(__u8 word, unsigned int shift)
+static inline __must_check __u8 ror8(__u8 word, unsigned int shift)
 {
 	return (word >> shift) | (word << (8 - shift));
 }
@@ -139,7 +139,7 @@ static inline __u8 ror8(__u8 word, unsigned int shift)
  *
  * This is safe to use for 16- and 8-bit types as well.
  */
-static inline __s32 sign_extend32(__u32 value, int index)
+static inline __must_check __s32 sign_extend32(__u32 value, int index)
 {
 	__u8 shift = 31 - index;
 	return (__s32)(value << shift) >> shift;
@@ -150,7 +150,7 @@ static inline __s32 sign_extend32(__u32 value, int index)
  * @value: value to sign extend
  * @index: 0 based bit index (0<=index<64) to sign bit
  */
-static inline __s64 sign_extend64(__u64 value, int index)
+static inline __must_check __s64 sign_extend64(__u64 value, int index)
 {
 	__u8 shift = 63 - index;
 	return (__s64)(value << shift) >> shift;


