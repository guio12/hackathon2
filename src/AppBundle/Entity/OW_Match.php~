<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * OW_Match
 *
 * @ORM\Table(name="ow_match")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\OW_MatchRepository")
 */
class OW_Match
{
    /**
     * @ORM\OneToMany(targetEntity="AppBundle\Entity\PlayedMap", mappedBy="owMatch")
     */
    private $playedMaps;

    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var int
     *
     * @ORM\Column(name="round", type="integer")
     */
    private $round;

    /**
     * @var int
     *
     * @ORM\Column(name="match_num", type="integer")
     */
    private $matchNum;

    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Team")
     * @ORM\JoinColumn(nullable=true)
     */
    
    private $team1;

    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Team")
     * @ORM\JoinColumn(nullable=true)
     */
    private $team2;

    /**
     * @var int
     *
     * @ORM\Column(name="score1", type="integer")
     */
    private $score1;

    /**
     * @var int
     *
     * @ORM\Column(name="score2", type="integer")
     */
    private $score2;


    /**
     * Get id.
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set round.
     *
     * @param int $round
     *
     * @return OW_Match
     */
    public function setRound($round)
    {
        $this->round = $round;

        return $this;
    }

    /**
     * Get round.
     *
     * @return int
     */
    public function getRound()
    {
        return $this->round;
    }

    /**
     * Set matchNum.
     *
     * @param int $matchNum
     *
     * @return OW_Match
     */
    public function setMatchNum($matchNum)
    {
        $this->matchNum = $matchNum;

        return $this;
    }

    /**
     * Get matchNum.
     *
     * @return int
     */
    public function getMatchNum()
    {
        return $this->matchNum;
    }

    /**
     * Set team1.
     *
     * @param string $team1
     *
     * @return OW_Match
     */
    public function setTeam1($team1)
    {
        $this->team1 = $team1;

        return $this;
    }

    /**
     * Get team1.
     *
     * @return string
     */
    public function getTeam1()
    {
        return $this->team1;
    }

    /**
     * Set team2.
     *
     * @param string $team2
     *
     * @return OW_Match
     */
    public function setTeam2($team2)
    {
        $this->team2 = $team2;

        return $this;
    }

    /**
     * Get team2.
     *
     * @return string
     */
    public function getTeam2()
    {
        return $this->team2;
    }

    /**
     * Set score1.
     *
     * @param int $score1
     *
     * @return OW_Match
     */
    public function setScore1($score1)
    {
        $this->score1 = $score1;

        return $this;
    }

    /**
     * Get score1.
     *
     * @return int
     */
    public function getScore1()
    {
        return $this->score1;
    }

    /**
     * Set score2.
     *
     * @param int $score2
     *
     * @return OW_Match
     */
    public function setScore2($score2)
    {
        $this->score2 = $score2;

        return $this;
    }

    /**
     * Get score2.
     *
     * @return int
     */
    public function getScore2()
    {
        return $this->score2;
    }
}
