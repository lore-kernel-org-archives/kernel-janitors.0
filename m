From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 19 Apr 2017 13:34:33 +0000
Subject: Re: [PATCH] ASoC: Intel: Skylake: fix dereference before NULL check on ebus
Message-Id: <fa93c146-cb7b-cefa-75d3-6507c63200c5@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170419121613.12353-1-colin.king@canonical.com>
 <20170419133249.ac3sdmn7kqjbxaii@mwanda>
In-Reply-To: <20170419133249.ac3sdmn7kqjbxaii@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, Dharageswari R <dharageswari.r@intel.com>, Vinod Koul <vinod.koul@intel.com>, Pardha Saradhi K <pardha.saradhi.kesapragada@intel.com>, Jayachandran B <jayachandran.b@intel.com>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jeeja KP <jeeja.kp@intel.com>, "Subhransu S . Prusty" <subhransu.s.prusty@intel.com>, linux-kernel@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>

On 19/04/17 14:32, Dan Carpenter wrote:
> On Wed, Apr 19, 2017 at 01:16:13PM +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> ebus is being NULL checked however it is being dereferenced
>> earlier on the assignment bus = ebus_to_hbus(ebus).  Fix this
>> by moving the assignment to after the NULL check on ebus to
>> avoid a NULL pointer dereference error.
>>
> 
> ebus_to_hbus() doesn't dereference "ebus" it just uses it for pointer
> math.
> 
> #define ebus_to_hbus(ebus)      (&(ebus)->bus)
> 
> If you pass a NULL to there, it returns an offset starting from NULL but
> it doesn't Oops.

Doh, brown paper bag moment for me.

> 
> regards,
> dan carpenter
> 
> 

