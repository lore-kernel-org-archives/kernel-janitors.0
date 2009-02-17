From: Sam Ravnborg <sam@ravnborg.org>
Date: Tue, 17 Feb 2009 12:32:17 +0000
Subject: Re: [PATCH] Replace deprecated __initcall with device_initcall and fix whitespaces in kernel/kallsym
Message-Id: <20090217123217.GA25922@uranus.ravnborg.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30902160824l22b10dcblc89c718015e156c8@mail.gmail.com>
In-Reply-To: <ea11fea30902160824l22b10dcblc89c718015e156c8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> 
> Hmm.....after doing the changes when I saw the md5sum they are
> different :-( . Considering that I have done only whitespace fixes,
> few comments which exceeded 80 cols and replacing __initcall with
> device_initcall(). The sizes of object files are same.
> How should I go about finding why is the difference ?

Binary search undoing your changes one-by-one.

My bet is that it is either:
1) Move of EXPORT_SYMBOL
2) Delete one line where you moved an opening brace

The approch here is simple.
Split the patch is two parts.
One that keep the md5 sum, and a second much smaller patch that impact
the md5 sum. In this way you make it easier to review the changes that
impact the md5 sum.

	Sam
