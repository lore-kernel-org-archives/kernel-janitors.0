From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 14 Jan 2020 20:05:01 +0000
Subject: Re: [PATCH] ALSA: hda - fix out of bounds read on spec->smux_paths
Message-Id: <c826c500-1573-b42b-3c72-5c9f3123d0ed@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200114154412.365395-1-colin.king@canonical.com>
 <s5ho8v5renx.wl-tiwai@suse.de>
In-Reply-To: <s5ho8v5renx.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 14/01/2020 20:01, Takashi Iwai wrote:
> On Tue, 14 Jan 2020 16:44:12 +0100,
> Colin King wrote:
>>
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> It is possible for the call to snd_hda_get_num_conns to fail and return
>> a negative error code that gets assigned to num_conns. In that specific
>> case, the check of very large values of val against num_conns will not
>> fail the -EINVAL check and later on an out of bounds array read on
>> spec->smux_paths will occur.  Fix this by sanity checking for an error
>> return from the call to snd_hda_get_num_conns.
> 
> Thanks for the patch, but this can't happen.
> The ad1988_auto_smux_enum_put() is used only for IEC958 Playback
> Source element, and it's added in ad1988_add_spdif_mux_ctl().  And
> there at the beginning, there is already a check of the value:
> 
> 	num_conns = snd_hda_get_num_conns(codec, 0x0b) + 1;
> 	if (num_conns != 3 && num_conns != 4)
> 		return 0;
> 				
> And the snd_hda_get_num_conns() function returns the cached value,
> hence it's always same at the second and later calls, so it can't be a
> negative error.

Ah, OK, sorry about the noise.

> 
> That said, I don't think we need to apply the change as is.  But if we
> were to improve something, we can rather record this number more
> explicitly e.g. introduce a new field spec->num_spdif_mux_conns and
> keep there instead of calling snd_hda_get_num_conns() at each place.

That would seem more optimal for sure.

Colin
> 
> 
> thanks,
> 
> Takashi
> 
>>
>> Addresses-Coverity: ("Out-of-bounds read")
>> Fixes: 272f3ea31776 ("ALSA: hda - Add SPDIF mux control to AD codec auto-parser")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  sound/pci/hda/patch_analog.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/pci/hda/patch_analog.c b/sound/pci/hda/patch_analog.c
>> index 88c46b051d14..399561369495 100644
>> --- a/sound/pci/hda/patch_analog.c
>> +++ b/sound/pci/hda/patch_analog.c
>> @@ -756,9 +756,11 @@ static int ad1988_auto_smux_enum_put(struct snd_kcontrol *kcontrol,
>>  	struct ad198x_spec *spec = codec->spec;
>>  	unsigned int val = ucontrol->value.enumerated.item[0];
>>  	struct nid_path *path;
>> -	int num_conns = snd_hda_get_num_conns(codec, 0x0b) + 1;
>> +	int num_conns = snd_hda_get_num_conns(codec, 0x0b);
>>  
>> -	if (val >= num_conns)
>> +	if (num_conns < 0)
>> +		return num_conns;
>> +	if (val >= num_conns + 1)
>>  		return -EINVAL;
>>  	if (spec->cur_smux = val)
>>  		return 0;
>> -- 
>> 2.24.0
>>
