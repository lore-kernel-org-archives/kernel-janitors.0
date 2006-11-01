From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Wed, 01 Nov 2006 02:28:21 +0000
Subject: Re: [KJ] [PATCH] Changed all calls to pci_module_init to be
Message-Id: <45480645.2040903@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061028201039.GB20208@zeno.unh.edu>
In-Reply-To: <20061028201039.GB20208@zeno.unh.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

eaburns@bender.eaburns.mooo.com wrote:
>>>>> I wouldn't mind doing that.  Just a simple find/replace of 'FALSE' 
>>>>>           
>>>> with 'false'
>>>>         
>>>>> and 'TRUE' with 'true'?
>>>>>           
>>>> Both yes and no. Of course you can do a simple replace (like just using
>>>> sed with "s/FALSE/false/") but I think it is a good idea to check the
>>>> paths for the variables to see they are real booleans (only gets 'false'
>>>> and 'true', also only used in logical operations) and also clean up
>>>> things like "if (b = TRUE)". If you make such a patch, can you cc: me
>>>> too, please?
>>>>         
>>> Is this a janitor project ? Is anyone working on it ?
>>>       
>> Not really, have not thought about it actually. Just thought, since 
>> there is a generic boolean in the kernel now, it would be a good 
>> janitorial task, don't you think? I have yet to get around and start 
>> seriously produce patches and if it should be a "project", who should I 
>> see about that?
>>     
>
> Maybe this is more of a newbie question than a janitorial question:
> I was going to try to fix a few of these, however, I was not sure how to get
> certain files to compile.  For example, I found a few arch/ppc files that I
> tried to make this change to, but I do not have a ppc I have an x86_64 and an
> i386.  Is there at way that I can at least try to compile these files?  I
> realize that I wouldn't be able to test it, but in a case like this I feel
> like a successfull compile would be a good start.
>
> If there is no easy (I could probably do a complete cross compile, but that's
> a lot more work than I am willing to do for this little change I made) way to
> compile this, what's the usual procedure for somthing like this?  Don't do the
> change if you can't compile it, or make a patch and see if someone else will
> try it for you?
>
> 		--Ethan
>   
I believe a cross-compiler is the only way to compile it in your case, 
so I would think a good re-reading, and yet another, would be sufficient 
to then send it to the mailing-list with a note that you have not 
compiled it (and why). Hopefully someone with the ability will do it for 
you.
After all, if you find something suspicious but you can't fix it, you 
still can mail the list with the problem, because we are all here to 
make a damn good kernel, aren't we ;)

Just my opinion...
Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
