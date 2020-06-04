From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 04 Jun 2020 05:43:14 +0000
Subject: Re: dmaengine: stm32-mdma: call pm_runtime_put if pm_runtime_get_sync fails
Message-Id: <3eca8df2-22ae-06e0-5809-c11e459915d5@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <873bfb31-52d8-7c9b-5480-4a94dc945307@web.de>
 <CAMuHMdU3wMT_pnh4NE9W9Su6qip_oObgd6OiRCwfuvouqjXKHA@mail.gmail.com>
In-Reply-To: <CAMuHMdU3wMT_pnh4NE9W9Su6qip_oObgd6OiRCwfuvouqjXKHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Geert Uytterhoeven <geert@linux-m68k.org>, Navid Emamdoost <navid.emamdoost@gmail.com>, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Cc: Alexandre Torgue <alexandre.torgue@st.com>, Dan Williams <dan.j.williams@intel.com>, Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Qiushi Wu <wu000273@umn.edu>, Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

>>> Calling pm_runtime_get_sync increments the counter even in case of
>>> failure, causing incorrect ref count. Call pm_runtime_put if
>>> pm_runtime_get_sync fails.
>>
>> Is it appropriate to copy a sentence from the change description
>> into the patch subject?
>>
>> How do you think about a wording variant like the following?
>>
>>    The PM runtime reference counter is generally incremented by a call of
>>    the function “pm_runtime_get_sync”.
>>    Thus call the function “pm_runtime_put” also in two error cases
>>    to keep the reference counting consistent.
>
> IMHO the important part is "even in case of failure", which you dropped.
> Missing that point was the root cause of the issue being fixed.
> Hence I prefer the original description, FWIW.

Would you like to comment any more of the presented patch review concerns?

Can it make sense to combine any adjustments into a single patch
according to the discussed software transformation pattern?
https://lore.kernel.org/patchwork/project/lkml/list/?submitter=26544&state=*&q=engine%3A+stm32&archive=both

Regards,
Markus
