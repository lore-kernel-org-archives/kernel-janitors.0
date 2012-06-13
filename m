From: walter harms <wharms@bfs.de>
Date: Wed, 13 Jun 2012 07:23:44 +0000
Subject: Re: [Q] Cleaning string whitespace trimming. Does it make any sense?
Message-Id: <4FD84000.6030706@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CALF0-+V15wjFhZH5P1C+4sJ9QSw7QY5Rk383S4XhVVCBsnXUQw@mail.gmail.com>
In-Reply-To: <CALF0-+V15wjFhZH5P1C+4sJ9QSw7QY5Rk383S4XhVVCBsnXUQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 13.06.2012 00:03, schrieb Ezequiel Garcia:
> On Tue, Jun 12, 2012 at 5:58 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>> Actually, on second thought strim() already does what we want.  Just
>> ignore the return value.
>>
> 
> But it could make sense to fix such redundant code?
> 
> I'm unsure what git tree should I base the patches, given
> I'd be touching all over the place. Perhaps linux-next?
> 

Hi Ezequiel,
as rule-of-the-thumb: just do it.

Convenience functions like trim() are added add irregular intervals because
they appear only if someone spots a pattern that he things is worth the effort.
Older Code does not know about it, so changes are required through the whole
code (look at patches from Julia Lawall, she has developed a tool to spot pattern).

How does it look from a maintainers perspective ?
1. He can remove a function from your code and reduce what you have to maintain -> good
2. He has a special need and need its own code -> but at least you know about it now :)

in short: you can make nothing wrong

re,
 wh
