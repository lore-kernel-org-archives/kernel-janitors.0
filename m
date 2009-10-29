From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Thu, 29 Oct 2009 13:21:57 +0000
Subject: Re: Starting in the project
Message-Id: <390803460910290621xe493aedo456274d12966c360@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5b097d6e0910281338n2de53f4ie772e531b83f97c9@mail.gmail.com>
In-Reply-To: <5b097d6e0910281338n2de53f4ie772e531b83f97c9@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Wed, Oct 28, 2009 at 5:38 PM, Eduardo <dutche@gmail.com> wrote:
> Hi, I'm trying to enter in kernel janitors project to learn more about
> kernel and to be a developer.
> I'm in TODO page, but I don't know where to start. It's being a kind
> of weird at first glance to me.
> There is some task easy to do for me to start?
>

Another way you could help is cloning the last linux-next tree located
at git://git.kernel.org/pub/scm/linux/kernel/git/sfr/linux-next.git.
Then you could try compiling with differents configurations and see if
any problem/warning arises.

i.e:

# git clone git://git.kernel.org/pub/scm/linux/kernel/git/sfr/linux-next.git
# make randconfig
# make 2> warnings.log
# cat warnings.log

Also the staging drivers located at drivers/staging/ are a great place
for janitors/beginners. Those are drivers that compile but need some
work and cleaning before been accepted in mainline. Look at the TODO
files for the drivers to see what work is needed. The easiest job is
looking at the coding style if it is following the coding style
specified at /Documentation/CodingStyle.txt.

Best regards,

-----------------------------------------
Javier Mart=C3=ADnez Canillas
+595 981 88 66 58
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
