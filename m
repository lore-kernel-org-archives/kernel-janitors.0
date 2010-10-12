From: Jarod Wilson <jarod@redhat.com>
Date: Tue, 12 Oct 2010 13:12:57 +0000
Subject: Re: [patch -next] V4L/DVB: IR/streamzap: fix usec to nsec conversion
Message-Id: <20101012131257.GB4057@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101012060110.GA13176@bicker>
In-Reply-To: <20101012060110.GA13176@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Oct 12, 2010 at 08:01:11AM +0200, Dan Carpenter wrote:
> There is an integer overflow here because 0x03000000 * 1000 is too large
> for 31 bits.
> 
> rawir.duration should be in terms of nsecs.
> IR_MAX_DURATION and 0x03000000 are already in terms of nsecs.
> STREAMZAP_TIMEOUT and STREAMZAP_RESOLUTION are 255 and 256 respectively
> and are in terms of usecs.
> 
> The original code had a deadline of 1.005 seconds and the new code has a
> deadline of .065 seconds. 
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Nice catch, fix looks good.

Acked-by: Jarod Wilson <jarod@redhat.com>

-- 
Jarod Wilson
jarod@redhat.com

