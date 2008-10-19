From: "M. Asselstine" <asselsm@mcmaster.ca>
Date: Sun, 19 Oct 2008 01:32:58 +0000
Subject: Re: patch status?
Message-Id: <919fe2b30810181832v4dc4986oca26a7b8bca4276c@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a91986340810181447q5667393cjff747a913f81ea9a@mail.gmail.com>
In-Reply-To: <a91986340810181447q5667393cjff747a913f81ea9a@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Oct 18, 2008 at 5:47 PM, Mike Steiner <mike65536@gmail.com> wrote:
> I sent my first patch to the list a couple days ago and haven't heard
> anything back yet. Did I do something wrong, or is everyone just real
> busy? It wasn't a bug fix or anything important, so it's no big deal
> but I'm just curious.
>

I noticed that your patch was only sent to the KJ mailing list and not
to any maintainer. Although many maintainers, such as Andrew Morton
and David Miller, watch this list it is important to include someone
in the TO of your email that has an interest in your patch and has a
tree to apply it to. Most of this is covered in
Documentation/SubmittingPatches.  I have looked at your patch and I am
not sure introducing such a change is really necessary, this might
also be part of why you have not heard anything.

Mark

> Mike Steiner
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
