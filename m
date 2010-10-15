From: Dan Carpenter <error27@gmail.com>
Date: Fri, 15 Oct 2010 20:54:33 +0000
Subject: Re: [patch] Staging: intel_sst: off by one bug
Message-Id: <20101015205433.GP6614@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101015203644.GO6614@bicker>
In-Reply-To: <20101015203644.GO6614@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Btw I don't understand the sst_drv_ctx->streams[] array.

What is stored in streams[0]?  

What does MRST from MAX_NUM_STREAMS_MRST and get_mrst_stream_id() stand
for?  I understand that MRST streams are SND_SST_DEVICE_HEADSET,
SND_SST_DEVICE_IHF, and SND_SST_DEVICE_VIBRA.  What makes them different
from SND_SST_DEVICE_HAPTIC and SND_SST_DEVICE_CAPTURE?

regards,
dan carpenter
