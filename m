Received: from sonic306-21.consmr.mail.ne1.yahoo.com (sonic306-21.consmr.mail.ne1.yahoo.com [66.163.189.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2EC28C5C3
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Jun 2025 15:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.189.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751297607; cv=none; b=tmsZao4049mRvyz0gTT2Jfz/dpBI7MGi89Kuz2FL7e0imaSnUIhq3tQTR5elpvSlNkEDw723MMuP+Ic4oKPLyMkA7eo535D1o2bSYqDAdVejoJAhcTPlRsF9KAemAzOJ9Y3z5EH9fL6fLQdRgRKq5BGXKyGOGLl/oRhyV9b1eJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751297607; c=relaxed/simple;
	bh=QZE+qIFjkd2dbfAKtPaAbsYf9r3kJjDhVvv5v2o/5bI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J62zDCXD2ZbfsMhrSc25JWEXB0g/LbFkKtFRn7b/pq3DWLh1NYmNeVMLhR9oBijssoNep62cDHEQzgIzGpxOmw3ONoX9u8pP3/xjQWLGxZ5q6ICzF5iS6FVP3rvZKFZlLjmlSo9yWlE363uyRu7Q7Qi9BFCsErrGVLbnmUfm7WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com; spf=pass smtp.mailfrom=aol.com; dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b=d5MGIyYq; arc=none smtp.client-ip=66.163.189.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aol.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b="d5MGIyYq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1751297605; bh=ljSRz8rzRu7TXY0zoNV48xFkUbN9sDkJF93tzLpDY4o=; h=Subject:From:To:Date:In-Reply-To:References:From:Subject:Reply-To; b=d5MGIyYq6NSFOzgMU520qFQoVOscdBysQEzkne11/8qPatvHqCXusPdQUpF1AdOXm+uHC7LI8iCY03MUS0Yjh7jp7PyAMKEtgnI3WMCV6DKeK1NUvYWKdE5I+tckZ7ychnDpjUa6KwIa6dccDk4NpnLp0dwfulKLhngd8OI/FGAxax/P0UPnMBBz3IbpCmokg8E7UrZsr+YePNO2UPSG1IaPXhSmpgFgiVIqruXf3FiGy98MjrMOZY1uNjxq4WfCf/I9SpCaGTaDBsteWap+Bck9+4RmwL6dFmmYLl9G/4YiYBNM8vjRwIebbJoN+tdA+Ap5O8tSwsDXSLqaEPJn8Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1751297605; bh=VnFED7EV9nIKV0TnqpQlJhb9X5FOpV9IbCnRe76Z+2L=; h=X-Sonic-MF:Subject:From:To:Date:From:Subject; b=aTEONVXq2791Hdhxo7HYOskLnNZBXeNjZ4Crry4y5cJkafhoK/p8ql6Js9Y56u2BdMRK/6vPD9GFsFUhV+Cl4kxTlzS721qH+UMZ+RXHiHa7mOPIKqeZEsGAW43fDCpFOGjs9KPm3nnufWmGBcz2azmKceRblCwEnwRwbuHNQ06FDWeEU4qv7qIczoNy2Q8z0t7IoYY48fLK22U99RlqsBvZdPNNDon5+vd/F3wHPvy8Wy3p4jaqC6qS4K1g0QmbMdGtNlT2Uh1hunTq45LwL/ofjECWjY8aoDiUTcJkb2EGQnU1PcCpXnRhk6tXCkoWrx147xFKhxjSXIOQsQQ0Eg==
X-YMail-OSG: csMsDyMVM1m399e43cYe7P696X3INWb2soQ_PG4FCv6ymJBKbno65lp4I.qO84Z
 54QAIxmHZqJRqotZJkLtWYCwNNQDASS50kJRkuXcB8FLsua6KBEO2ioNom3tkK4v23IgMltXOIGG
 vmWRUgUc_78AFa_inibFywqwHsFgIU6fTuokaT7jKGKUCVksBdL3EQPByYDABZ1FdRGIDa9Us71C
 WsMmsDIt6jaY8uu7li5rmMH2h2rr0MOdMHbdTpXOOG3O4i2cu.pe4e3K8D6rX3MXUlRqDOhCnoL5
 NsdTdW71vaI9FR4a99rJmaSiUI2wyd2B7Q9D0S8.LkkQJOH5CtA5iiXiqLh.H1a7wSsmtuLx5bPg
 Bp_UnAZR5bKOWABx3L6.pXno3SeFz2MS5_oRooeV.7ljbJudwEoo60rYSRPwtCucMwDVVo9m8RmS
 Qpx8pe_ewsZU2YEkyVauwcsgP99nYpivpsOfmkJxkbd6pG8Ji0twBL3rZBB25vP1Fki5KjV_8TCB
 uC3WEpsCi7.EguDPpJTcX7DZ_xMk.jaXEEZU9ikqPdJlcp2f7YFczZuXn9dBLKeryGeX6rzBnxnu
 HCPB215X4TTkebNQly5NflZZgm_Mzgwpq_Egs5A0tciiZpnQqdnCvoeaxmMLe39IRXqG7Y5paOVF
 0O21wmI7YGTRu9j.KG1mj0R4tbWbaUuddRnRV94Qd1q8I0QuV_b4wg_gchxW6WjPgGXcGsyS4J3s
 JYEsL2zW780JpylnD95DDy0m2OYw5McIudRBrY8cOiPrS2awR0mDCQI30MATDM6WPCnqY9p0E1rD
 70IvjZbVsnZ5xwA9ElToeCXR77dCa.cxokFKoatv8Tg3pqJvcU6UNV5NADOQLo7f4HoTe_ngYKRp
 mWCC7amvoFl145L6NQ_2y0CcZh7Qoq3ixr1s4WpvwPRajAn4L9ltfAOkrI2IqvSfYmZ0OOU8tXCt
 PghNsnWeo433A4CCf4Q.I3niN1AMdVeMwUz_N5X8k_GEB5UoANvAQMJxDo5qh4cChpmSI22Ww9cU
 fsgoBgmH4L2AkeYMQ02rWAxd3hPThiChQpNJFh14uYYWPG91tboXnEnC3xhvT.jG79zlsaN7u3vS
 49CX7GWk_vgGbwdPZIxgrgjW1pVQPsqKLN5Que1DRIjQS6vovREiiyvUCaKgMnrMItQlFuivQaTs
 J2d1gU.vPTNTvg_JrFbfDbV3.8ZsdA7LCymysjCHwDP0U0Fni1bYvkJ6TAPfa.jzaG6XHKUjSVHQ
 AwuOac68TUn5UMdIwxs5WVaQq9GILPw_HMGsfg2Td6i165Wzx6YpAT3t.gQ1enCrz7F.C5NolacY
 _ETlzSd89ZkFcbTEeDdG2FKjCDy7KwqLw0FvIwZ.FGn9BryPymHrse5nTVf4L1MmTAWV4e7tKW4H
 if8FdXgJVGK9zhcxBNJ1tMV7OxBHuTR1ePpCtnUYqKUyotJJ5soYPsJ1x1lPAo3IhK0OVUN1zfeG
 wLyE7CSGsg68qZpUIu14DS55_liuC2O3Jk0tEycXJduzrVlj5_22qvPknMVQRgA96tzOfznbF6cY
 0ybdt6Vs5k.aN_zBW4_76ixFkdr_qJvJgmurbd80MCsdi0qdvBAnc3cHsw6eQmaao96OJn8oCPh8
 oGt8MM6EBGKgbqy1yCqq2wvRXJ9_Mv8M0xxgpjmrqZThbAz7aiyy5w2JoXmCBeRKhaI.P_i5CXIl
 aUPMArXJpz4ePAG5VvW1.uhaJ81NYyCYghyD6DC3_g7RVhOcZXlgnzEMgaMxnO9YsaTVcABviXrM
 PzWow37crWmKDqrHD2l21zbEz6G3TPqe5tB9lrZS0VWOCOu2hjSg0AqOsA5kqgOLTurvk_IIMJuT
 yfCHasMz8IsdJ_iIpOOAcpsjE6RsC9KOb1BV3TA2aiNA7up_JwQ5_NXN_9hBiSiKpOYtbKQWzq1v
 MDq4dO5wL3RD0ztA4oD6C_GfG2A9Zo0zM5OOvU_kHy0IADp785P25Ej2UIzh2EfhxmTuKawPCYgq
 lW0ILjxte6hKcvnDkOjkOjfHrWcW2gBAhctPrj6114KzEaTyInsj_bfZqILQ18aPvXuyoGKJVuUB
 .Oxzku6n1Ar0aGfUpQiwJRkhH24LxsZ6dKh58I9wqqGadM3rpZCQysTK5sQyx8j97ennff0im6tr
 lAkNE6IiJdRRdUis..NFxZNa.fKi4gXqmPYuDTbPWV8W6DlQ0IXtBk6mfbg.YTmJ_8lXwU1FOLjo
 BOsg-
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 765bf113-5631-42c7-a1bf-b0d0f292fad6
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.ne1.yahoo.com with HTTP; Mon, 30 Jun 2025 15:33:25 +0000
Received: by hermes--production-ir2-858bd4ff7b-ljvkz (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 9f96c35f5ff3a3f7a6b2c510f5aac743;
          Mon, 30 Jun 2025 14:42:49 +0000 (UTC)
Message-ID: <62bf7393f9314ff875e5eebf6575b72997a6fd2e.camel@aol.com>
Subject: Re: I have a pile of potential janitorial work for interested
 parties
From: Ruben Wauters <rubenru09@aol.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, Kernel Janitors List
	 <kernel-janitors@vger.kernel.org>
Date: Mon, 30 Jun 2025 15:42:47 +0100
In-Reply-To: <ebfb23a6-def8-24a8-8958-28213a3c0da5@crashcourse.ca>
References: <ebfb23a6-def8-24a8-8958-28213a3c0da5@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mailer: WebService/1.1.24076 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On Sat, 2025-06-28 at 17:08 -0400, Robert P. J. Day wrote:
>=20
> =C2=A0 Quite some time ago, I was immersed in a bunch of Linux kernel
> janitorial work, and I wrote a bunch of scripts that scanned the
> kernel source tree and identified obvious candidates for
> simplification and cleanup. I'm going to publish all of that to my
> website in the very near future, but just to clarify what I mean, let
> me provide a single example to see if this is still relevant, or
> whether I'm off-base.
>=20
> =C2=A0 One of the scripts I wrote scanned the kernel tree for what I call
> "badref selects", those being entries in Kconfig files that
> "select"ed
> config entries that did not exist (probably the result of someone
> deleting config entries, but not checking to see if anything selected
> that entry). Such occurrences are not fatal, but they are obvious
> candidates for cleanup.
>=20
> =C2=A0 I just ran that script on the current source tree just for the
> drivers/ directory, and here's the output I got:
>=20
>=20
> $ find_badref_selects.sh drivers
> =3D=3D=3D=3D=3D DRM_DEBUG_SELFTEST
> drivers/gpu/drm/i915/Kconfig.debug:53:	select DRM_DEBUG_SELFTEST
> =3D=3D=3D=3D=3D DRM_KMS_DMA_HELPER
> drivers/gpu/drm/adp/Kconfig:9:	select DRM_KMS_DMA_HELPER
> drivers/gpu/drm/logicvc/Kconfig:7:	select DRM_KMS_DMA_HELPER
> =3D=3D=3D=3D=3D TEST_KUNIT_DEVICE_HELPERS
> drivers/iio/test/Kconfig:11:	select TEST_KUNIT_DEVICE_HELPERS
>=20
>=20
> This output suggests that those "selects" refer to config entries
> that
> do not exist, and so could likely be removed as janitorial work.
>=20
> =C2=A0 Does the above make sense? If I recursively grep for the strings,
> say, "TEST_KUNIT_DEVICE_HELPERS", I see only that select statement,
> and nothing else. I'm assuming that means it's superfluous. If this
> makes sense, I can publish my scanning scripts and others are welcome
> to use them to find stuff that can be cleaned up.
>=20
> =C2=A0 Thoughts?

Hello,

Thank you for highlighting this, I believe this is a good target for
cleanup, and I would be interested in any other scripts you have that
provide similar information.

I am fairly new to linux kernel development in general, not having a
large amount of patches to my name, however, opportunities for cleanup
and janitorial work, while often neglected by other programmers for
larger features, still are important in my opinion, as it creates a
more maintainable and cleaner codebase, as such I would be very much
interested in any cleanup opportunities.

Thank you very much

Ruben Wauters

> rday
