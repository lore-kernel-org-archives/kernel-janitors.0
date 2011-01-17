From: walter harms <wharms@bfs.de>
Date: Mon, 17 Jan 2011 08:08:07 +0000
Subject: Re: [patch] [SCSI] target: dubious one-bit signed bitfield
Message-Id: <4D33F8E7.5030900@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110115140445.GD2721@bicker> <4D31CCFB.1060504@bfs.de> <20110115165401.GE2721@bicker>
In-Reply-To: <20110115165401.GE2721@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, "Nicholas A. Bellinger" <nab@linux-iscsi.org>, James Bottomley <James.Bottomley@suse.de>, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org



Am 15.01.2011 17:54, schrieb Dan Carpenter:
> On Sat, Jan 15, 2011 at 05:36:11PM +0100, walter harms wrote:
>>
>>
>> Am 15.01.2011 15:04, schrieb Dan Carpenter:
>>> The signed one-bit types can be 0 or -1 which can cause a problem if
>>> someone ever checks if (foo->lu_gp_assoc = 1).  The current code is
>>> fine because everyone just checks zero vs non-zero.  But Sparse
>>> complains about it so lets change it.  The warnings look like this:
>>>
>>
>> Your code looks ok,
>> but to avoid that kind of errors it may be better to use int here.
>>
> 
> I'm afraid I don't understand what you are saying.
> 

IMHO, it is better to just drop the bitfield. Most people expect int as return.

re,
 wh
