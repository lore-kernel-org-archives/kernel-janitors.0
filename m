Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 367C9C433F5
	for <kernel-janitors@archiver.kernel.org>; Tue,  4 Jan 2022 09:52:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbiADJwM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 4 Jan 2022 04:52:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbiADJwM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 4 Jan 2022 04:52:12 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61A66C061761
        for <kernel-janitors@vger.kernel.org>; Tue,  4 Jan 2022 01:52:12 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id g80so62623837ybf.0
        for <kernel-janitors@vger.kernel.org>; Tue, 04 Jan 2022 01:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i4eLQl/dEbvyG1Wql7ifOQAi2iNl+1DCBzvyzVIvBIo=;
        b=Ydn/8/RL69ZspGQtSw8seJ4typOFQYLcy2QzgeeR0jv4tkzN4E8SujKnXPZTkpyH2L
         acsoegtrfGq0TfKOlKgC1HlXSNbRoGSJjZRztE/IrkBSC22riK6ViytP7aHHLXuTt7sM
         n42sSzjljsrNlSeszXR/PuqAA96Q+mJH8nlTrLtK5GYszZ9ohVE77aA55yJFx0iX4Lg5
         Wknlwj7eiVBAqGST16jvXx+OCvKvWH1VwgMOc6gpQd2RyzYvr7j55raLQdvdMXaxGHe8
         Mxi1sGZr9V4w/Ewye0uSYk2isfZutbvb7QB66Qj+KUJO6ClcU8eMmfxsET69QFfChre3
         6WLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i4eLQl/dEbvyG1Wql7ifOQAi2iNl+1DCBzvyzVIvBIo=;
        b=dGHjA+niC7TP6QucKFd+bEhoLxGuONx0Qn50QXOc+WTLU6nL6S0Q7CniXvCp2uvwqz
         OCc33juiX1H5L9Gx1Jvbv+Qm1x58nUvOFMMsEtiGJ+obBcJw2j+ejhQ0pClq2LOdaI0d
         AaqvOiex6BP5yd+9cdnyM4lh5I5i0K08AtVylhgpL2JzEenJLxZWgRQ6lupNamPBu/Dv
         hpzoIGgUZZGa20mdde1Vo5/8HuvTW+NDj9F31j0rKmiWi6puegmAoa8YlWcVJieOYsVb
         QFF9pLTyE1Bp/iYNAqPT47kZo7ySJIXTL/IWESYQwE7qjr6lihNU4YYObcfBW0DErnII
         frOg==
X-Gm-Message-State: AOAM5309ge1U9rtRa0h2rimnqgFv1d91nt7nNLV5aC07LfMSfFS6v6f8
        ytLZPTaNmpN8fWP2edFEidaPPSlXxO+bFqaVdu4ynYsX8b8=
X-Google-Smtp-Source: ABdhPJzEd3h/v5yyOJIpJU7X+rJ4/q0tIU+LcY2V7f23bb9X5UK827bORAUtmkpdudDQwFYDaMsWkAHcMvjNil4coOM=
X-Received: by 2002:a25:500f:: with SMTP id e15mr57927598ybb.312.1641289931363;
 Tue, 04 Jan 2022 01:52:11 -0800 (PST)
MIME-Version: 1.0
References: <c3af0ef3-1c9b-4893-f63d-fd24c4b9b689@infradead.org>
In-Reply-To: <c3af0ef3-1c9b-4893-f63d-fd24c4b9b689@infradead.org>
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date:   Tue, 4 Jan 2022 10:52:00 +0100
Message-ID: <CAKXUXMzDGGoy4PYAKyKHgU7jHhP56dZpOCqGfhgiBqunOmAV+w@mail.gmail.com>
Subject: Re: janitors suggestion: MAINTAINERS file
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     kernel-janitors <kernel-janitors@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jan 4, 2022 at 4:30 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
> Run './scripts/get_maintainer.pl --self-test' in a kernel git tree
> and fix some of the problems there.
>

I have been running ./scripts/get_maintainer.pl --self-test=patterns
regularly on linux-next for about a year now. Running
./scripts/get_maintainer.pl --self-test=patterns only takes about a
minute, as it does not try to check the response of all the URLs in
MAINTAINERS, which takes quite some time due to sequentially
requesting URLs and waiting for a timeout in case it does not get an
immediate response.

You find many of the commits on this janitor task with:

git log --grep="./scripts/get_maintainer.pl --self-test"

Here are my insights of the regular runs:

In general, these cleanup commits are appreciated, they are usually
acked by the authors and not discussed a lot.

Sometimes, issues appear in MAINTAINERS because changes from one patch
series are split and travel through different maintainer trees with
different speed.

Recently, many issues in MAINTAINERS for --self-test=patterns result
from devicetree bindings text to yaml conversions; they are converted,
the file name changes, but MAINTAINERS is not adjusted. IMHO,
submissions of the MAINTAINERS clean-up patches would need to be
picked up by Rob Herring, but these patches were pending last year a
lot (not being picked up), so that I finally submitted them for
inclusion through the -mm tree from Andrew Morton.

The script ./scripts/documentation-file-ref-check also reports some
issues in MAINTAINERS (partly overlapping with
./scripts/get_maintainer.pl --self-test). It also provides a
simplistic --fix option. Mauro Carvalho Chehab runs this script
regularly and submits clean-up patches as well. Usually any of those
cleanup patches does the job.

Currently, when a patch renames, moves or deletes files, checkpatch.pl
generally reports a FILE_PATH_CHANGES warning: "Whenever files are
added, moved, or deleted, the MAINTAINERS file patterns can be out of
sync or outdated. So MAINTAINERS might need updating in these cases."
(https://www.kernel.org/doc/html/latest/dev-tools/checkpatch.html#others).
That is generally a good hint, but quite unspecific (and hence,
probably sometimes ignored as too unspecific). IMHO, developers would
benefit from a dedicated script that reports exactly after a file-path
change or change to MAINTAINERS, for which files/paths the assignment
to MAINTAINERS sections (and/or the responsibility of developers) has
changed. Then, the developer can check if that was intended or not.

Even better than creating those cleanup patches is to avoid them
before the inclusion of breaking changes in the repository. The
challenge is to track and test all patches coming through on the
mailing list. A suitable CI system to run ./scripts/get_maintainer.pl
--self-test=patterns to identify the breaking patches would help.
Sofar, none of the CI systems is currently doing that.

Further, reasonable cleanup activities around MAINTAINERS:

- Assigning files in Documentation/ABI/ and include/ to the right
MAINTAINERS section. I already played around with some heuristics to
guess the right section automatically, but I did not find much time to
develop that much further than a simple experiment so far.

- Checking if the mentioned maintainers in the section are still
active, e.g., observing commits in the git repository and email
exchange on the mailing lists (lore.kernel.org helps), and if not,
proposing to remove them or declaring a section orphan for giving
somebody a chance to adopt it. Jonathan Corbet had developed a part of
that analysis already in the gitdm tool for an LWN article last year.
Ralf Ramsauer et al. have developed some similar scripts for parsing
MAINTAINERS with python.

If someone is interested in helping out here, I will gladly support
getting started on this janitorial task.


Lukas
