From: Shuah Khan <shuahkh@osg.samsung.com>
Date: Wed, 15 Oct 2014 15:12:46 +0000
Subject: Re: [patch] [media] xc5000: use after free in release()
Message-Id: <543E8EEE.7080404@osg.samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140925114008.GC3708@mwanda> <20141015134008.GO26918@mwanda>
In-Reply-To: <20141015134008.GO26918@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Shuah Khan <shuah.kh@samsung.com>
Cc: Fabian Frederick <fabf@skynet.be>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On 10/15/2014 07:40 AM, Dan Carpenter wrote:
> On Thu, Sep 25, 2014 at 02:40:08PM +0300, Dan Carpenter wrote:
>> I moved the call to hybrid_tuner_release_state(priv) after
>> "priv->firmware" dereference.
>>
>> Fixes: 5264a522a597 ('[media] media: tuner xc5000 - release firmwware from xc5000_release()')
> 
> We still need this patch.
> 

I didn't see it in media pull request for 3.18. Mauro probably
has this on his list for next round.

-- Shuah


-- 
Shuah Khan
Sr. Linux Kernel Developer
Samsung Research America (Silicon Valley)
shuahkh@osg.samsung.com | (970) 217-8978
