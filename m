From: Asim <linkasim@gmail.com>
Date: Wed, 18 Jan 2012 17:45:08 +0000
Subject: Re: busy loops in kernel
Message-Id: <CAFTXMEJ0R+3r7SR54xuosjFyG8dLPR0Qy=1w3k-+Vx906MMVUw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAFTXME+fNAqqZjO4oRmbwt2cFbaDgbLW9gg94tzJvF4bwy7DtQ@mail.gmail.com>
In-Reply-To: <CAFTXME+fNAqqZjO4oRmbwt2cFbaDgbLW9gg94tzJvF4bwy7DtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi Greg,

This is a 6 month old kernel. 2.6.38. I am now working to get the
results in 3.2.1 kernel. I cross checked and most drivers still have
these problems even though in some cases the line numbers have changed
by an offset.
I will send the 3.2.1 results as soon as I can to this list. I am
mostly facing issues with macros like DEFINE_TIMER which just breaks
all over analyses and have surprising spread all over the drivers
directory.

But as I said earlier, most of the problems still  remain, in many
cases with the same line numbers..

Thanks,
Asim

On Tue, Jan 17, 2012 at 8:55 PM, Greg Dietsche <gregory.dietsche@cuw.edu> w=
rote:
> On 1/17/2012 10:15 PM, Asim wrote:
>> The list is here =3D> http://pages.cs.wisc.edu/~kadav/busy_waits.txt =A0I
>> have added some caveats to be on the safe side. I will also add/update
>> this list as time passes by and as these are fixed (or as I identify
>> more).
> Hi Asim,
> What version of the kernel source was used to generate this list?
>
> Thanks,
> Greg
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
