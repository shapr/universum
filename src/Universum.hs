{-# LANGUAGE CPP                   #-}
{-# LANGUAGE FlexibleContexts      #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE Trustworthy           #-}

-- | Main module that reexports all functionality allowed to use
-- without importing any other modules. Just add next lines to your
-- module to replace default ugly 'Prelude' with better one.
--
-- @
--     {-# LANGUAGE NoImplicitPrelude #-}
--
--     import Universum
-- @

module Universum
       ( -- * Reexports from base and from modules in this repo
         module X  -- Should I expand this to all modules to remove haddock warnings?
       , module Base

         -- * Useful classes
       , Buildable

         -- * Useful standard unclassifed functions
       , evaluateNF
       , evaluateNF_
       , evaluateWHNF
       , evaluateWHNF_
       , guarded
       , identity
       , map
       , pretty
       , prettyL
       , print
       , readEither
       , show
       , uncons
       , unsnoc

         -- * Convenient type aliases
       , LText
       , LByteString
       ) where

import           Applicative              as X
import           Bool                     as X
import           Containers               as X
import           Conv                     as X
import           Debug                    as X
import           Exceptions               as X
import           Functor                  as X
import           Lifted                   as X
import           List                     as X
import           Monad                    as X
import           Print                    as X
import           TypeOps                  as X
import           VarArg                   as X

import           Base                     as Base hiding (error, show, showFloat,
                                                   showList, showSigned, showSignedFloat,
                                                   showsPrec, undefined)
import qualified Base                     as PBase

import           Data.String              as X (IsString (..))

-- Maybe'ized version of partial functions
import           Safe                     as X (atDef, atMay, foldl1May, foldr1May,
                                                headDef, headMay, initDef, initMay,
                                                initSafe, lastDef, lastMay, tailDef,
                                                tailMay, tailSafe)

-- Applicatives and Bifunctors and Arrows
import           Control.Applicative      as X (Alternative (..), Applicative (..),
                                                Const (..), ZipList (..), liftA, liftA2,
                                                liftA3, optional, (<**>))
import           Control.Arrow            as X ((&&&))
import           Data.Bifunctor           as X (Bifunctor (..))

-- Base typeclasses
import           Data.Eq                  as X (Eq (..))
import           Data.Foldable            as X (Foldable, concat, concatMap, foldlM,
                                                foldrM, maximumBy, minimumBy)
import           Data.Functor.Identity    as X (Identity (..))
import           Data.Ord                 as X (Down (..), Ord (..), Ordering (..),
                                                comparing)
import           Data.Traversable         as X (Traversable (..), fmapDefault,
                                                foldMapDefault, forM, mapAccumL,
                                                mapAccumR)

#if ( __GLASGOW_HASKELL__ >= 800 )
import           Data.List.NonEmpty       as X (NonEmpty (..), nonEmpty)
import           Data.Monoid              as X
import           Data.Semigroup           as X (Option (..), Semigroup (sconcat, stimes),
                                                WrappedMonoid, cycle1, mtimesDefault,
                                                stimesIdempotent, stimesIdempotentMonoid,
                                                stimesMonoid)
#else
import           Data.Monoid              as X
#endif

-- Deepseq
import           Control.DeepSeq          as X (NFData (..), deepseq, force, ($!!))

-- Data structures
import           Data.Hashable            as X (Hashable)
import           Data.HashMap.Strict      as X (HashMap)
import           Data.HashSet             as X (HashSet)
import           Data.IntMap.Strict       as X (IntMap)
import           Data.IntSet              as X (IntSet)
import           Data.List                as X (break, cycle, drop, dropWhile, filter,
                                                genericDrop, genericLength,
                                                genericReplicate, genericSplitAt,
                                                genericTake, group, inits, intercalate,
                                                intersperse, isPrefixOf, iterate,
                                                permutations, repeat, replicate, reverse,
                                                scanl, scanr, sort, sortBy, splitAt,
                                                subsequences, tails, take, takeWhile,
                                                transpose, unfoldr, zip, zipWith)
import           Data.Map.Strict          as X (Map)
import           Data.Sequence            as X (Seq)
import           Data.Set                 as X (Set)
import           Data.Tuple               as X (curry, fst, snd, swap, uncurry)

#if ( __GLASGOW_HASKELL__ >= 710 )
import           Data.Proxy               as X (Proxy (..))
import           Data.Typeable            as X (Typeable)
import           Data.Void                as X (Void, absurd, vacuous)
#endif

-- Base types
import           Data.Bits                as X (xor)
import           Data.Bool                as X (Bool (..), not, otherwise, (&&), (||))
import           Data.Char                as X (chr)
import           Data.Int                 as X (Int, Int16, Int32, Int64, Int8)
import           Data.Maybe               as X (Maybe (..), catMaybes, fromMaybe, isJust,
                                                isNothing, mapMaybe, maybe, maybeToList)
import           Data.Word                as X (Word, Word16, Word32, Word64, Word8,
                                                byteSwap16, byteSwap32, byteSwap64)

import           Data.Function            as X (const, fix, flip, on, ($), (.))

-- Generics and type level magic
import           GHC.Generics             as X (Generic)
#if ( __GLASGOW_HASKELL__ >= 710 )
import           GHC.TypeLits             as X (CmpNat, KnownNat, KnownSymbol, Nat,
                                                SomeNat (..), natVal, someNatVal)
#endif

-- Buildable
import           Data.Text.Buildable      (Buildable (build))
import           Data.Text.Lazy.Builder   (toLazyText)

-- ByteString
import           Data.ByteString          as X (ByteString)
import qualified Data.ByteString.Lazy

-- Text
import           Data.Text                as X (Text, lines, unlines, unwords, words)
import qualified Data.Text.Lazy

import           Data.Text.Lazy           as X (fromStrict, toStrict)

import           Data.Text.Encoding       as X (decodeUtf8', decodeUtf8With)
import           Data.Text.Encoding.Error as X (OnDecodeError, OnError, UnicodeException,
                                                lenientDecode, strictDecode)
import           Text.Read                as X (Read, readMaybe, reads)

-- IO
import           System.IO                as X (FilePath, Handle, IOMode (..), stderr,
                                                stdin, stdout, withFile)

-- Lenses
import           Lens.Micro               as X (Lens, Lens', Traversal, Traversal', over,
                                                set, (%~), (&), (.~), (<&>), (^.), (^..),
                                                (^?), _1, _2, _3, _4, _5)
import           Lens.Micro.Mtl           as X (preuse, preview, use, view)

-- For internal usage only
import qualified Control.Exception.Base   (evaluate)
import qualified Prelude                  (print)
import qualified Text.Read                (readEither)

-- | Type synonym for 'Data.Text.Lazy.Text'.
type LText = Data.Text.Lazy.Text

-- | Type synonym for 'Data.ByteString.Lazy.ByteString'.
type LByteString = Data.ByteString.Lazy.ByteString

-- | Renamed version of 'Prelude.id'.
identity :: a -> a
identity x = x

-- | 'Prelude.map' generalized to 'Functor'.
map :: Functor f => (a -> b) -> f a -> f b
map = fmap

-- | Destructuring list into its head and tail if possible. This function is total.
--
-- >>> uncons []
-- Nothing
-- >>> uncons [1..5]
-- Just (1,[2,3,4,5])
-- >>> uncons (5 : [1..5]) >>= \(f, l) -> pure $ f == length l
-- Just True
uncons :: [a] -> Maybe (a, [a])
uncons []     = Nothing
uncons (x:xs) = Just (x, xs)

-- | Similar to 'uncons' but destructuring list into its last element and
-- everything before it.
unsnoc :: [x] -> Maybe ([x],x)
unsnoc = foldr go Nothing
  where
    go x mxs = Just (case mxs of
       Nothing      -> ([], x)
       Just (xs, e) -> (x:xs, e))

-- | Lifted version of 'Prelude.print'.
print :: (X.MonadIO m, PBase.Show a) => a -> m ()
print = liftIO . Prelude.print

-- | Polymorhpic version of 'Text.Read.readEither'.
--
-- >>> readEither @Text @Int "123"
-- Right 123
-- >>> readEither @Text @Int "aa"
-- Left "Prelude.read: no parse"
readEither :: (ToString a, Read b) => a -> Either Text b
readEither = X.first toText . Text.Read.readEither . X.toString

-- | Version of 'Prelude.guard' that takes verification function.
-- Can be used in some similar way:
-- @
--     safeSum :: Int -> Int -> Maybe Int
--     safeSum a b = do
--         verifiedA <- guarded (>0) a
--         verifiedB <- guarded (>0) b
--         pure $ verifiedA + verifiedB
-- @
guarded :: (Alternative f) => (a -> Bool) -> a -> f a
guarded p x = X.bool empty (pure x) (p x)

-- | Generalized version of 'Prelude.show'.
show :: (Show a, IsString b) => a -> b
show x = X.fromString (PBase.show x)
{-# SPECIALIZE show :: Show  a => a -> Text  #-}
{-# SPECIALIZE show :: Show  a => a -> LText  #-}
{-# SPECIALIZE show :: Show  a => a -> ByteString  #-}
{-# SPECIALIZE show :: Show  a => a -> LByteString  #-}
{-# SPECIALIZE show :: Show  a => a -> String  #-}

-- | Functions to show pretty output for buildable data types.
pretty :: Buildable a => a -> Text
pretty = X.toStrict . prettyL

-- | Similar to 'pretty' but for 'LText'.
prettyL :: Buildable a => a -> LText
prettyL = toLazyText . build

-- | Lifted alias for 'Control.Exception.Base.evaluate' with clearer name.
evaluateWHNF :: MonadIO m => a -> m a
evaluateWHNF = liftIO . Control.Exception.Base.evaluate

-- | Like 'evaluateWNHF' but discards value.
evaluateWHNF_ :: MonadIO m => a -> m ()
evaluateWHNF_ what = (`seq` ()) <$!> evaluateWHNF what

-- | Alias for @evaluateWHNF . force@ with clearer name.
evaluateNF :: (X.NFData a, MonadIO m) => a -> m a
evaluateNF = evaluateWHNF . force

-- | Alias for @evaluateWHNF . rnf@. Similar to 'evaluateNF'
-- but discards resulting value.
evaluateNF_ :: (X.NFData a, MonadIO m) => a -> m ()
evaluateNF_ = evaluateWHNF . rnf
