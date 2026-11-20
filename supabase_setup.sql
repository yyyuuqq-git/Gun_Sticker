-- 칭찬스티커 (건) 테이블 스키마 (Supabase SQL)

CREATE TABLE IF NOT EXISTS public.praise_boards (
    id TEXT PRIMARY KEY,
    title TEXT NOT NULL,
    target_count INTEGER NOT NULL DEFAULT 30,
    reward_text TEXT,
    editor_pin TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.praise_stickers (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    board_id TEXT REFERENCES public.praise_boards(id) ON DELETE CASCADE NOT NULL,
    sticker_index INTEGER NOT NULL,
    memo TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
    UNIQUE(board_id, sticker_index)
);
