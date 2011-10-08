From: "Bojan Smojver" <bojan@rexursive.com>
Date: Sat, 08 Oct 2011 13:11:23 +0000
Subject: Re: [patch] PM / Hibernate: NULL dereferences on error paths
Message-Id: <4543687634.1002586283@rexursive.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111007132453.GA31424@elgon.mountain>
In-Reply-To: <20111007132453.GA31424@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

------- Original message -------
> From: Dan Carpenter
> Sent: 8.10.'11,  21:51
>
> On Sat, Oct 08, 2011 at 09:28:48PM +1100, Bojan Smojver wrote:
>> +out_clean:
>> + if (data) {
>> +  for (thr = 0; thr < nr_threads; thr++) {
>> +   if (data[thr].thr)
>> +    kthread_stop(data[thr].thr);
>> +  }
>> +  vfree(data);
>> + }
>> + if (page) free_page((unsigned long)page);
>>
>
> This obviously works, but why don't you use a normal kernel unwind
> style?  You tried this complicated error handling before and it
> already caused bugs...  It's simpler if the error handling code has
> no if statements.

With the introduction of threads, there were so many unwind places, that I 
thought I may forget something in some of them, therefore causing different 
bugs. So, I put everything under out_clean, so it's all done in one place. 
Obviously, everything's a trade-off in life. :-)

--
Bojan 
