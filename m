Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443A03BAD87;
	Wed, 11 Mar 2026 07:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773215891; cv=none; b=aao/LFfcDllSD51K1RKBGivuqKjl5jqnahIjspMat4Ee313eWPwc9t8Bkd6ICLWDpK0fxgXYY7s1aXKTu4tcckDsnnS4QYaGCPB5Cp/qos0RMcpWP88N6Iox2H54cyJ5IviZNdkZyno9nheHkHwqJtNyUC7UvMwcP94jl9s0zBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773215891; c=relaxed/simple;
	bh=XokWuTpncXSjpN+KWRvpsnM9g51LqBeOKYgCJJYlGtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SAvIuG1PpXgX0rf5jPXSU1W4xKRfTwn8MBkGOZ9b+aRoqI/2PIbG9qJGCQKZqqfOFVnad/rer0NZ584N5f/MBYr6l7WE/feuX/pRN5ST6EWhLua8AVGbaQvnOeFzT3MzBQ9rU1LKGDGfm182x7ByDf3rsVcS+SkfKDdVbHSOVCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZipSIUY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZipSIUY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 735FDC4CEF7;
	Wed, 11 Mar 2026 07:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773215890;
	bh=XokWuTpncXSjpN+KWRvpsnM9g51LqBeOKYgCJJYlGtE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aZipSIUYEcFwsCJpSMeiuZrzFNC2NVRKGvlNb9Y0GVJz83QTmLBcca7k90lcIFnxe
	 SGeBuAHwHpWlkbJ54TXb0ya8BA9togCxERGPo5rn+Jb9ZrPkdBs9I1jaE6p6U2T8Lw
	 6OSD8pIR0kOdP/9Tgf3958NYKAALYr72exFYoPERZIHvxueKR2XfMVLEowewk4OF5G
	 Ep+Mp0bCL/HCD6oAaXX4CMpW0ijFSnQY1WRKDsPU/9tFE1RZMjcc5YKM4z/R/ja77j
	 uE2F+6fM1Sq0NsLbhm6vWRC3/cifSprMnogWXT88m/AETAgTRhwzGdIeg2zTPBWiW5
	 Bhc2655kbvlFQ==
From: Maxime Ripard <mripard@kernel.org>
To: Joel Fernandes <joelagnelf@nvidia.com>,
	Dave Airlie <airlied@redhat.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Arun Pravin <arunpravin.paneerselvam@amd.com>,
	Christian Koenig <christian.koenig@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in GPU BUDDY ALLOCATOR
Date: Wed, 11 Mar 2026 08:58:06 +0100
Message-ID: <177321588315.206976.3171976575683341775.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311043314.265627-1-lukas.bulwahn@redhat.com>
References: <20260311043314.265627-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 11 Mar 2026 05:33:14 +0100, Lukas Bulwahn wrote:
> The commit 4a9671a03f2b ("gpu: Move DRM buddy allocator one level up (part
> one)") and commit ba110db8e1bc ("gpu: Move DRM buddy allocator one level up
> (part two)") split the majority of the file drivers/gpu/drm/drm_buddy.c
> into drivers/gpu/buddy.c, with some pieces remaining in the original
> location drivers/gpu/drm/drm_buddy.c.
> 
> The commits also adjust the file entries in the GPU BUDDY ALLOCATOR
> section, but as part of that, change the file entry to the non-existing
> file drivers/gpu/drm_buddy.c instead of keeping the reference to the
> existing file drivers/gpu/drm/drm_buddy.c.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
