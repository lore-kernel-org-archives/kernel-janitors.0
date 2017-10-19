From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 19 Oct 2017 11:18:17 +0000
Subject: Re: kernel/module: Delete an error message for a failed memory allocation in add_module_usage()
Message-Id: <43c71898-82c3-215a-3176-e1a6d56ef10a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a47bc166-7592-2ff8-9b94-4d45e18b6004@users.sourceforge.net>
 <20171019110824.wqkep7bpcx3dcw5w@redbean>
In-Reply-To: <20171019110824.wqkep7bpcx3dcw5w@redbean>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jessica Yu <jeyu@kernel.org>
Cc: kernel-janitors@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, LKML <linux-kernel@vger.kernel.org>

>> Omit an extra message for a memory allocation failure in this function.
>>
>> This issue was detected by using the Coccinelle software.
>>
>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> 
> Applied to modules-next, thanks.

Thanks for your acceptance of this update suggestion after a bit of clarification.

Do you see any need that I should extend subsequent commit messages
for this software transformation pattern?

Regards,
Markus
