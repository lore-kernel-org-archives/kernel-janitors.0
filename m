From: "Mark Asselstine" <asselsm@gmail.com>
Date: Fri, 23 May 2008 20:35:19 +0000
Subject: Re: bad_page_fault oops
Message-Id: <919fe2b30805231335v67baa813ve4a38530f8fec962@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <919fe2b30805160525q565f929t46067c1d0e7d98dc@mail.gmail.com>
In-Reply-To: <919fe2b30805160525q565f929t46067c1d0e7d98dc@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, May 23, 2008 at 10:43 AM, Roberto A. Foglietta
<roberto.foglietta@gmail.com> wrote:
> 2008/5/16 M. Asselstine <asselsm@mcmaster.ca>:
>
>>
>> Have you tried to attach a JTAG or use other tools such as LKCD. Do a
>> search for "linux kernel crash panic howto" and you will find lots of
>> useful information. When you are really stuck then try the mailing
>> lists again.
>>
>
>  AFAIK the LKCD patch exist for 2.6.10 but no any later kernel version.
>  I did not found any alter. Is it right?
>
Ya, you are correct. To be honest I would probably use the system.map
method to narrow down the place that is causing the crash and then
strategically place some printks to take me the rest of the way in
discovering the error. Once you have the offending function you can
often spot the defect with some code inspection.

Regards,
Mark


>  Thanks,
> --
> /roberto
>
