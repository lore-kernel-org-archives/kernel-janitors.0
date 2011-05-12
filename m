From: matt mooney <mfmooney@gmail.com>
Date: Thu, 12 May 2011 21:07:57 +0000
Subject: Re: [Resend PATCH] package: Makefile: fix perf target bug
Message-Id: <BANLkTimKpJoUnoYx8gXi6KCYgVpnXno4ow@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1d7d3b31c0da82ce8ce75778922155b7004a8f7e.1305224477.git.mfm@muteddisk.com>
	<4DCC4365.3030907@suse.cz>
In-Reply-To: <4DCC4365.3030907@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

2011/5/12 Michal Marek <mmarek@suse.cz>:
> On 12.5.2011 20:25, mfmooney@gmail.com wrote:
>> diff --git a/scripts/package/Makefile b/scripts/package/Makefile
>> index 1b7eaea..a32dc2d 100644
>> --- a/scripts/package/Makefile
>> +++ b/scripts/package/Makefile
>> @@ -118,10 +118,14 @@ perf-tar=3Dperf-$(KERNELVERSION)
>>
>> =A0quiet_cmd_perf_tar =3D TAR
>> =A0 =A0 =A0 =A0cmd_perf_tar =3D \
>> -git archive --prefix=3D$(perf-tar)/ HEAD^{tree} =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 \
>> - =A0 =A0 $$(cat $(srctree)/tools/perf/MANIFEST) -o $(perf-tar).tar; =A0\
>> +git --git-dir=3D$(srctree)/.git --work-tree=3D$(srctree) =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0\
>
> Neither git archive not git rev-parse need the work tree, --git-dir=3D..
> is sufficient.

Are you sure? --git-dir points to the .git directory and --work-tree
points to the actual source code directory. Both are needed when you
are out of the source tree and the .git directory is not really
located at .git from the $PWD.

From an empirical standpoint, this as well as any git command that is
issued from outside of the working directory fails to function
properly without --work-tree.

-matt

>
>> + =A0 =A0 archive --prefix=3D$(perf-tar)/ HEAD^{tree} =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 \
>> + =A0 =A0 $(addprefix $(srctree)/, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
>> + =A0 =A0 =A0 $(shell cat $(srctree)/tools/perf/MANIFEST)) =A0 =A0 =A0 =
=A0 =A0 =A0 =A0\
>> + =A0 =A0 -o $(perf-tar).tar; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
>> =A0mkdir -p $(perf-tar); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
>> -git rev-parse HEAD > $(perf-tar)/HEAD; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0\
>> +git --git-dir=3D$(srctree)/.git --work-tree=3D$(srctree) =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0\
>> + =A0 =A0 rev-parse HEAD > $(perf-tar)/HEAD; =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0\
>> =A0tar rf $(perf-tar).tar $(perf-tar)/HEAD; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0\
>> =A0rm -r $(perf-tar); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
>> =A0$(if $(findstring tar-src,$@),, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
>
>



--=20
GPG-Key: 9AFE00EA
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
