From: Oleg Drokin <green@linuxhacker.ru>
Date: Sun, 03 May 2015 19:43:41 +0000
Subject: Re: [RFC PATCH 0/3] Moving lustre procfs stuff to sysfs & questions.
Message-Id: <A11961F9-BEF3-4B4E-BE89-5B7418373FCD@linuxhacker.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430622608-30402-1-git-send-email-green@linuxhacker.ru>
In-Reply-To: <1430622608-30402-1-git-send-email-green@linuxhacker.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


On May 3, 2015, at 2:15 PM, Greg Kroah-Hartman wrote:

>> Also I found that cgroup does calls into kernfs directly, gaining
>> ability to register seq_file files and otherwise do all sorts of
>> stuff that would be cool to do from lustre too ;)
> If you want to make lustrefs, be my guest, you can do whatever you want
> in that, using kernfs, but that's not ok for sysfs, sorry.

If only __kernfs_create_file was exported=85 ;)

Otherwise you cannot really do that from modules.

Bye,
    Oleg--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
