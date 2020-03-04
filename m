From: Keyon Jie <yang.jie@linux.intel.com>
Date: Wed, 04 Mar 2020 07:46:01 +0000
Subject: Re: [PATCH] ASoC: SOF: Fix snd_sof_ipc_stream_posn()
Message-Id: <3adf3c7d-7cf4-92c0-5653-465eeefd37ed@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200303101858.ytehbrivocyp3cnf@kili.mountain>
 <alpine.DEB.2.21.2003031321410.2957@eliteleevi.tm.intel.com>
 <993233ff-1492-5a87-1026-09af76f6fc7f@linux.intel.com>
 <20200304070710.GA12003@ubuntu>
In-Reply-To: <20200304070710.GA12003@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>, Slawomir Blauciak <slawomir.blauciak@linux.intel.com>, Mark Brown <broonie@kernel.org>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Dan Carpenter <dan.carpenter@oracle.com>



On 3/4/20 3:07 PM, Guennadi Liakhovetski wrote:
> On Tue, Mar 03, 2020 at 09:36:29AM -0600, Pierre-Louis Bossart wrote:
>>
>>
>>>> We're passing "&posn" instead of "posn" so it ends up corrupting
>>>> memory instead of doing something useful.
>>> [...]
>>>>    	/* send IPC to the DSP */
>>>>    	err = sof_ipc_tx_message(sdev->ipc,
>>>> -				 stream.hdr.cmd, &stream, sizeof(stream), &posn,
>>>> +				 stream.hdr.cmd, &stream, sizeof(stream), posn,
>>>>    				 sizeof(*posn));
>>>
>>> ack, thanks, this is clearly wrong. This function is not used by current
>>> platforms, so the bug has gone unnnoticed. Most platforms either rely on
>>> direct MMIO queries of the DSP position, or the periodic position updates
>>> DSPs send after each ALSA period. This function for host to query DSP
>>> position via IPC is thus not used, although it's part of the generic audio
>>> DSP IPC interface.
>>>
>>> For the SOF folks in CC, I wonder should we keep this function at all?
>>>
>>> Anyways, that's probably a longer discussion, so while it's there,
>>> the code should be correct, so for the patch:
>>> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
>>
>> I checked all the way to 5.2 and it was never used, so indeed wondering what
>> the purpose of this function was.
> 
> I actually have a patch, removing that function, which I noticed as being unused
> during my VirtIO work. I think it was used by compressed.c before.

The function was designed for getting the full picture of the pipeline 
position inside the FW, including the host position(the closest one to 
the ALSA buffer), the dai rendering position, the system timestamp, etc.

Iirc, the function could be used for precise position control, AV sync, 
hammock harbor, etc.

Handling to this IPC is already implemented in SOF firmware(which means 
we can already get it from the FW), I think nobody is calling the 
function as we haven't had the corresponding requirement yet.

Thanks,
~Keyon

> 
> Thanks
> Guennadi
> 
