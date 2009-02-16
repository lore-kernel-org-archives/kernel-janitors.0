From: Dave Airlie <airlied@gmail.com>
Date: Mon, 16 Feb 2009 13:29:32 +0000
Subject: Re: [PATCH] drm/i915: Storage class should be before const qualifier
Message-Id: <21d7e9970902160529m297a20a9l82475b544947a4d3@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090209210242.GA7163@xenon.distanz.ch>
In-Reply-To: <20090209210242.GA7163@xenon.distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Feb 16, 2009 at 10:52 PM, Jiri Kosina <jkosina@suse.cz> wrote:
> On Mon, 9 Feb 2009, Tobias Klauser wrote:
>
>> The C99 specification states in section 6.11.5:
>>
>> The placement of a storage-class specifier other than at the beginning
>> of the declaration specifiers in a declaration is an obsolescent
>> feature.
>>
>> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
>> ---
>>  drivers/gpu/drm/i915/intel_sdvo.c |    2 +-
>>  drivers/gpu/drm/i915/intel_tv.c   |    2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/intel_sdvo.c b/drivers/gpu/drm/i915/intel_sdvo.c
>> index 4072154..249e0a3 100644
>> --- a/drivers/gpu/drm/i915/intel_sdvo.c
>> +++ b/drivers/gpu/drm/i915/intel_sdvo.c
>> @@ -147,7 +147,7 @@ static bool intel_sdvo_write_byte(struct intel_output *intel_output, int addr,
>>
>>  #define SDVO_CMD_NAME_ENTRY(cmd) {cmd, #cmd}
>>  /** Mapping of command numbers to names, for debug output */
>> -const static struct _sdvo_cmd_name {
>> +static const struct _sdvo_cmd_name {
>>      u8 cmd;
>>      char *name;
>>  } sdvo_cmd_names[] = {
>> diff --git a/drivers/gpu/drm/i915/intel_tv.c b/drivers/gpu/drm/i915/intel_tv.c
>> index fbb35dc..56485d6 100644
>> --- a/drivers/gpu/drm/i915/intel_tv.c
>> +++ b/drivers/gpu/drm/i915/intel_tv.c
>> @@ -411,7 +411,7 @@ struct tv_mode {
>>   * These values account for -1s required.
>>   */
>>
>> -const static struct tv_mode tv_modes[] = {
>> +static const struct tv_mode tv_modes[] = {
>>       {
>>               .name           = "NTSC-M",
>>               .clock          = 107520,
>
> This doesn't seem to be picked by anyone for current -next/-mmotm, I have
> applied it to trivial tree. Thanks,

Its in my queue for Linus drm-fixes tree already.

Dave.
