Received: from mail.hotelshavens.com (mail.hotelshavens.com [217.156.64.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F4A1B8E9B
	for <kernel-janitors@vger.kernel.org>; Fri, 16 Aug 2024 13:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.156.64.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723814474; cv=none; b=o5lAWt2xmPDldV6LAi3nWYGRxtuGPSKbOFH1kBcLs0N6q9pgb7hhGXcQfHvKECVkaCpnvmpS+Oii9nWKXw3sdoJvCbgK1sZVcYLK3DpXp9jZ7XAzYKJkJ9cfRF/PWpz9NESG1LNAwwsYpJPeHBS76mS5J6fr/pO06hGBa61y2uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723814474; c=relaxed/simple;
	bh=eqIB1n7zlCOOcw4IuG40Cpbx4jC4Dou+yQt/keQqOzY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F8ldxrHRzMoF0gBPNgDWDCvx7maHG/JwmM1IFY0SQ3Q/EdzZVUbgX/2lTyRVM7hrJkM0IXINfzQQ2wbX00oRkCa/wfm29lDDv035HcV3y86wnqxBqF/3hYjsfzSeyj1qppP0PC2eP2ebrbCTm5GiDQk+RSZZJr1jBfWFZqYa/38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotelshavens.com; spf=pass smtp.mailfrom=hotelshavens.com; dkim=pass (4096-bit key) header.d=hotelshavens.com header.i=admin@hotelshavens.com header.b=LKNpBlWW; arc=none smtp.client-ip=217.156.64.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotelshavens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotelshavens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=hotelshavens.com header.i=admin@hotelshavens.com header.b="LKNpBlWW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=dkim; d=hotelshavens.com;
 h=Reply-To:From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding; i=admin@hotelshavens.com;
 bh=eqIB1n7zlCOOcw4IuG40Cpbx4jC4Dou+yQt/keQqOzY=;
 b=LKNpBlWWSi1zZw+Nm+bQvKEptHorEt3ycIRaxNXY9Yrf7uCBPHUAS9WgVk4ipT71UEdOhgT93tTC
   aC0Z1YsIlemIAlsrHVgwjym1sWg1xgprMvwQBJuNNa3INcnbgdCf/p4Ixd+GcNZ0SvSpBbhUhXYd
   dDn+woOTGYnc1K+/bYmZKbaWdATPhhj2nW5hVa05L7mEDXHLlTfDSVLZn45C3ESUvigG9iuoh7/n
   b2GDlI+qTUkf5vL9bCdsuwRaDbJmc5vDLpQsAugiG7WBloycAeYR8v/4jT5c0q/gR3VvL5RRX9HF
   34kIZcX1UrO/vg5Tpabv/6ZU1DL6a3S6/VcBYd7IvyE4gMatfBYFve5f3fBxh1OjaU8Bbg1sLFyw
   s3RHRc0wI7iUD53RTLssB4dD7xZK6Vf66LTJUQ2DyKNIA+OcwcGgz+QD0JLpUNbKUsAancx2JbIj
   /tVm0Cgp7FGxftkHeQlej0Gz6I7YP73owhXmZi3szjuh9GDKK0judC7Kau9w1qYIRUeVL8y7mdjl
   6w2HCFGVUoSO2cuG0D3hX5NsSN3UESjUZWd1xWwciBbzMs65UJwrIh43nf6HiojJ/UbVUxM88iHR
   +NtjHtwd8p5QXSV0ZQlZqUe9XdRnnsStoJUnj12xEzZQBXmNX2E3U9UISFJYrbovGdBaFPuQfdw=
Reply-To: boris@undpkh.com
From: Boris Soroka <admin@hotelshavens.com>
To: kernel-janitors@vger.kernel.org
Subject: HI DEAR !
Date: 16 Aug 2024 15:16:04 +0200
Message-ID: <20240816134828.DEF4292231A677AB@hotelshavens.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Greetings,

Did you receive my last email message I sent to this Email=20
address: ( kernel-janitors@vger.kernel.org ) concerning=20
relocating my investment to your country due to the on going war=20
in my country Russia.

Best Regards,
Mr.Boris Soroka.
