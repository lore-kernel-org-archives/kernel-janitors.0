From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 25 May 2017 10:57:57 +0000
Subject: Re: MIPS: Alchemy: Delete an error message for a failed memory allocation in alchemy_pci_probe()
Message-Id: <6769aa4c-3a32-3ce5-fb65-f218016a1aa8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6ebb5193-239f-5c34-c5f6-2be8a2fa79a5@users.sourceforge.net>
 <CAOLZvyHq-7q0XxiBsyX3q0g0J3kjfFv4SU7amX1hpjRDyK+feQ@mail.gmail.com>
 <796029e7-60a3-a94b-8b5c-4686a0656560@users.sourceforge.net>
 <CAOLZvyH-DF_r77kzcVcn+A-tTov+aNZ1oGNQLnGWXE35UODqtQ@mail.gmail.com>
 <70394897-a67a-2b49-2d46-a20fb2de51f2@users.sourceforge.net>
 <CAOLZvyGEzzQ_Jvy3NNQqDER4QHe2Dj-Y4sX2MNANo-phXbzQ8g@mail.gmail.com>
In-Reply-To: <CAOLZvyGEzzQ_Jvy3NNQqDER4QHe2Dj-Y4sX2MNANo-phXbzQ8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manuel Lauss <manuel.lauss@gmail.com>, linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>, =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> * Why do you seem to insist on another message if information from a Linux
>>   allocation failure report would be sufficient already also for this
>>   software module?
>>
>> * Do you want that it can become easier to map a position in a backtrace
>>   to a place in your source code?
> 
> Does kmalloc() nowadays print a message which invocation (source line) failed?
> If so I won't be standing in your way, but if not, you need to come up with
> something for convincing than answering questions with more questions.

I suggest also to improve the corresponding documentation for the affected
programming interfaces in significant ways.
How are the chances for the desired clarification of relevant implementation details?

Regards,
Markus
