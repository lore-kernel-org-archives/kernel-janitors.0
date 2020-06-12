From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 12 Jun 2020 17:03:49 +0000
Subject: Re: [PATCH v2] proc/fd: Remove unnecessary variable initialisations in seq_show()
Message-Id: <98892099-4319-d442-5c6f-9f498d55e2c5@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200612160946.21187-1-pilgrimtao@gmail.com>
 <7fdada40-370d-37b3-3aab-bfbedaa1804f@web.de>
 <20200612170033.GF8681@bombadil.infradead.org>
In-Reply-To: <20200612170033.GF8681@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Matthew Wilcox <willy@infradead.org>, Kaitao Cheng <pilgrimtao@gmail.com>, linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, Colin Ian King <colin.king@canonical.com>, Muchun Song <songmuchun@bytedance.com>

>>> 'files' will be immediately reassigned. 'f_flags' and 'file' will be
>>> overwritten in the if{} or seq_show() directly exits with an error.
>>> so we don't need to consume CPU resources to initialize them.
>>
>> I suggest to improve also this change description.
>>
>> * Should the mentioned identifiers refer to variables?
>>
>> * Will another imperative wording be preferred?
>>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=b791d1bdf9212d944d749a5c7ff6febdba241771#n151
>>
>> * I propose to extend the patch a bit more.
>>   How do you think about to convert the initialisation for the variable “ret”
>>   also into a later assignment?
>
> Please stop commenting on people's changelogs.  You add no value.

Would you like to clarify concrete software development ideas?

Regards,
Markus
