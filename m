From: "Koul, Vinod" <vinod.koul@intel.com>
Date: Sun, 17 Oct 2010 10:53:57 +0000
Subject: RE: [patch] Staging: intel_sst: off by one bug
Message-Id: <438BB0150E931F4B9CE701519A44630104BE763767@bgsmsx502.gar.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101015203644.GO6614@bicker>
In-Reply-To: <20101015203644.GO6614@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

 
> Btw I don't understand the sst_drv_ctx->streams[] array.
This is used to store the runtime information related to the stream
> 
> What is stored in streams[0]?
Nothing :) its unused
In this array, the index refers to stream id which starts from 1 to x.
So I instead of adding stream id as field and subtracting one to get index, 
left [0] as unused.... 
> 
> What does MRST from MAX_NUM_STREAMS_MRST and get_mrst_stream_id() stand
> for?  I understand that MRST streams are SND_SST_DEVICE_HEADSET,
> SND_SST_DEVICE_IHF, and SND_SST_DEVICE_VIBRA.  What makes them different
> from SND_SST_DEVICE_HAPTIC and SND_SST_DEVICE_CAPTURE?
The driver supports two platforms, Moorestown (MRST) and Medfield (MFLD)
The capabilities of each are different. In former we support 3 streams
and in latter 5.
The driver assigns the stream id, for mrst, just in first come first server 
basis. In mfld, based on type of device opened, for instance Vibra will always 
be stream 3 and capture 5.

HTH
Vinod
