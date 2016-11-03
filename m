From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 03 Nov 2016 18:24:33 +0000
Subject: Re: [PATCH] btrfs: Remove some dead code
Message-Id: <db80cda8-0d26-48cb-7ca6-a61b91b0f3be@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161101102606.27006-1-christophe.jaillet@wanadoo.fr>
 <20161103124349.GA819@distanz.ch>
In-Reply-To: <20161103124349.GA819@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Tobias Klauser <tklauser@distanz.ch>
Cc: clm@fb.com, jbacik@fb.com, dsterba@suse.com, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 03/11/2016 =E0 13:43, Tobias Klauser a =E9crit :
> On 2016-11-01 at 11:26:06 +0100, Christophe JAILLET <christophe.jaillet@w=
anadoo.fr> wrote:
>> 'btrfs_iget()' can not return an error pointer, so this test can be
>> removed.
> This descrption does not match what the patch actually does. Shouldn't
> it say "...can not return NULL, so this test can be removed."?
>
You are obviously correct. Cut'n'Paste error while sending other patches.
I will send a V2 with an updated description.

Thanks for the review.

CJ
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
