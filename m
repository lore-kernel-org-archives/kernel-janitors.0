Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39141C433EF
	for <kernel-janitors@archiver.kernel.org>; Tue, 12 Oct 2021 10:39:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C066610A3
	for <kernel-janitors@archiver.kernel.org>; Tue, 12 Oct 2021 10:39:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235961AbhJLKla (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 12 Oct 2021 06:41:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:48146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235881AbhJLKla (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 12 Oct 2021 06:41:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E82B661050;
        Tue, 12 Oct 2021 10:39:26 +0000 (UTC)
Date:   Tue, 12 Oct 2021 12:39:24 +0200
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] coredump: Remove redundant initialization of
 variable core_waiters
Message-ID: <20211012103924.nem4ol3pxblcph3q@wittgenstein>
References: <20211011131635.30852-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211011131635.30852-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Oct 11, 2021 at 02:16:35PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable core_waiters is being initialized with a value that is never
> read, it is being updated later on. The assignment is redundant and can
> be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Thanks!
Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
