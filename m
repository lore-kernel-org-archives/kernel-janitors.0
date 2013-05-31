From: Harsh Kumar <harsh1kumar@gmail.com>
Date: Fri, 31 May 2013 16:30:58 +0000
Subject: Re: [Patch 2/2] Staging: winbond: Memory & urb freed
Message-Id: <51A8CD72.3050205@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <51A8C27B.9090003@gmail.com>
In-Reply-To: <51A8C27B.9090003@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On Friday 31 May 2013 09:27 PM, Dan Carpenter wrote:
> On Fri, May 31, 2013 at 09:02:11PM +0530, Harsh Kumar wrote:
>> Memory & urb should be freed before exiting from the function, I think.
>>
> 
> They are freed in Wb35Reg_EP0VM_complete() so this patch will make
> the system crash right away.  Btw, there are tons of real bugs that
> I know about but which I don't fix because I don't know what the
> right thing to do is.
> 

Ohh! Sorry, I missed it. That is why I was not sure about submitting this 
change. I need to be more thorough in checking this stuff. 

I have general question - Generally, shouldn't allocation and freeing up the 
memory be in the same function so that it is easy to make sure that everything 
is freed up after completion of task? Is it because there maybe certain cases 
where that may not be feasible or desirable to do so?

Harsh
