From: "Paolo Ciarrocchi" <paolo.ciarrocchi@gmail.com>
Date: Sun, 13 Jan 2008 22:13:59 +0000
Subject: Re: Statistics with checkpatch.pl
Message-Id: <4d8e3fd30801131413t5fbaea7bkf7dbe67e1a20d67a@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4d8e3fd30801131326n263c3b57t32289bcb49303e35@mail.gmail.com>
In-Reply-To: <4d8e3fd30801131326n263c3b57t32289bcb49303e35@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Jan 13, 2008 11:03 PM, Matthew Wilcox <matthew@wil.cx> wrote:
> On Sun, Jan 13, 2008 at 10:50:19PM +0100, Paolo Ciarrocchi wrote:
> > Looks like sort is only looking at the first digit.
>
> Try sort -n

Yes
cat /home/paolo/Desktop/checkpatch_output.txt |sort -n  --key=2| tail -n 10
works like a charm.

Thank you Matthew.

Ciao,
-- 
Paolo
http://paolo.ciarrocchi.googlepages.com/
