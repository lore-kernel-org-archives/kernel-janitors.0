From: Ritesh Raj Sarraf <rrs@researchut.com>
Date: Mon, 26 Dec 2005 03:40:19 +0000
Subject: Re: [KJ] Kernel Development Environment
Message-Id: <Pine.LNX.4.64.0512251936380.23922@mail.logicalwebhost.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c71658670512251844i58587d82h9181cf28e74a2017@mail.gmail.com>
In-Reply-To: <c71658670512251844i58587d82h9181cf28e74a2017@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 25 Dec 2005, Vishal Soni wrote:

> Hi,
>
> I am new to kernel development. I am have some questions.
>
> 1. Is there any documentation on how to setup kernel development
> environment?

vim, emacs et cetera.

> 2. Do kerenl developers use emulators (bochs, qeum) for kernel development?
> What are most commonly used emulators?

I'm not sure and won't understand why would they use emulators for
development. Can you explain your question little morein detail ?

Yes, qemu is a good emulator. I use it for beta OSes like Hurd.

> 3. How do i take to kernel source for kernel.org and setup the compiled
> kernel on a new box. I am instrested in how can I create a bare bone file
> system on the development box to do kernel development.
>

I'm surprised. You don't know how to compile a kernel but have plans for
fs development. Look for kernel compile howto @ tldp.org

rrs
-- 
Ritesh Raj Sarraf
RESEARCHUT -- http://www.researchut.com
"Stealing logic from one person is plagiarism, stealing from many is research."
"Necessity is the mother of invention."



-------------------------------------------------------
This SF.net email is sponsored by: Splunk Inc. Do you grep through log files
for problems?  Stop!  Download the new AJAX search engine that makes
searching your log files as easy as surfing the  web.  DOWNLOAD SPLUNK!
http://ads.osdn.com/?ad_idv37&alloc_id865&op=click
_______________________________________________
Kernel-janitor-discuss mailing list
Kernel-janitor-discuss@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kernel-janitor-discuss
