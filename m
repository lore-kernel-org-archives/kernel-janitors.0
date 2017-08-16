From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Date: Wed, 16 Aug 2017 19:54:02 +0000
Subject: Re: [PATCH][drm-next] drm/tinydrm: make function st7586_pipe_enable static
Message-Id: <8d0e6ad5-ff89-6f0a-60b5-55c7448d10cf@tronnes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170816092306.10969-1-colin.king@canonical.com>
 <c45857d5-b0cf-5259-89d8-0d4c3f66d96c@lechnology.com>
In-Reply-To: <c45857d5-b0cf-5259-89d8-0d4c3f66d96c@lechnology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Lechner <david@lechnology.com>, Colin King <colin.king@canonical.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Den 16.08.2017 17.46, skrev David Lechner:
> On 08/16/2017 04:23 AM, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The function st7586_pipe_enable  is local to the source
>> and does not need to be in global scope, so make it static.
>>
>> Cleans up sparse warning:
>> symbol 'st7586_pipe_enable' was not declared. Should it be static?
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>
> Acked-By: David Lechner <david@lechnology.com>

Thanks, applied to drm-misc.

Noralf.

