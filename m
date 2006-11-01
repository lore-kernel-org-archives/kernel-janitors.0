From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Wed, 01 Nov 2006 01:41:37 +0000
Subject: Re: [KJ] [PATCH] Changed all calls to pci_module_init to be
Message-Id: <4547FB51.1070806@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061028201039.GB20208@zeno.unh.edu>
In-Reply-To: <20061028201039.GB20208@zeno.unh.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Suren Naidu wrote:
>> >
>> > I wouldn't mind doing that.  Just a simple find/replace of 'FALSE' 
>> with 'false'
>> > and 'TRUE' with 'true'?
>> Both yes and no. Of course you can do a simple replace (like just using
>> sed with "s/FALSE/false/") but I think it is a good idea to check the
>> paths for the variables to see they are real booleans (only gets 'false'
>> and 'true', also only used in logical operations) and also clean up
>> things like "if (b = TRUE)". If you make such a patch, can you cc: me
>> too, please?
>
> Is this a janitor project ? Is anyone working on it ?
Not really, have not thought about it actually. Just thought, since 
there is a generic boolean in the kernel now, it would be a good 
janitorial task, don't you think? I have yet to get around and start 
seriously produce patches and if it should be a "project", who should I 
see about that?

cu
Richard Knutsson
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
