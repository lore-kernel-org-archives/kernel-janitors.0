From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 19 Dec 2017 17:12:13 +0000
Subject: Re: pwm: atmel-tcb: Delete an error message for a failed memory allocation in atmel_tcb_pwm_probe()
Message-Id: <a40d72aa-a8bd-a9df-358b-cfb368b71e46@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8274c498-1d1b-2ece-365c-98ded714a53c@users.sourceforge.net>
 <6d607786-4c1b-0949-0768-1bc0a4749fd5@microchip.com>
In-Reply-To: <6d607786-4c1b-0949-0768-1bc0a4749fd5@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-arm-kernel@lists.infradead.org

>> Omit an extra message for a memory allocation failure in this function.
>>
>> This issue was detected by using the Coccinelle software.
> 
> Can you point which coccinelle script highlited this issue?

Not directly (so far).

I constructed an approach for the semantic patch language based on
information from the script “checkpatch.pl”.
Would you like to improve it any ways?

Regards,
Markus
